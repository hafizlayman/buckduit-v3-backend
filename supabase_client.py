# supabase_client.py
"""
Shared Supabase client for BuckDuit v3.

This module ensures the backend always has a valid connection
to your Supabase instance. If environment variables are missing,
we throw a clear error instead of failing silently.
"""

import os
from supabase import create_client, Client


def get_supabase() -> Client:
    """
    Returns a Supabase client instance using environment variables.

    Required env:
        SUPABASE_URL
        SUPABASE_SERVICE_ROLE_KEY
    """
    url = os.getenv("SUPABASE_URL")
    key = os.getenv("SUPABASE_SERVICE_ROLE_KEY")

    if not url:
        raise RuntimeError("Missing SUPABASE_URL environment variable.")

    if not key:
        raise RuntimeError("Missing SUPABASE_SERVICE_ROLE_KEY environment variable.")

    client: Client = create_client(url, key)
    return client
