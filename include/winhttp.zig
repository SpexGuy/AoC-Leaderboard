const w = @import("std").os.windows;
const LPCWSTR = ?w.LPCWSTR;
const PCWSTR = LPCWSTR;
const LPWSTR = ?w.LPWSTR;
const PWSTR = ?w.PWSTR;
const LPSTR = ?w.LPSTR;
const LPDWORD = [*c]w.DWORD;
const PDWORD = LPDWORD;
const LPVOID = ?w.LPVOID;
const LPCVOID = ?w.LPCVOID;
const PVOID = ?w.PVOID;

const HANDLE = ?w.HANDLE;
const FILETIME = w.FILETIME;
const SYSTEMTIME = @compileError("TODO: Figure out what SYSTEMTIME is");

const DWORD_PTR = w.DWORD_PTR;
const DWORD = w.DWORD;
const WORD = w.WORD;
const BOOL = w.BOOL;
const ULONG = w.ULONG;
const ULONGLONG = w.ULONGLONG;
const BYTE = w.BYTE;
const USHORT = w.USHORT;

pub const INTERNET_DEFAULT_PORT = 0;
pub const INTERNET_DEFAULT_HTTP_PORT = 80;
pub const INTERNET_DEFAULT_HTTPS_PORT = 443;
pub const FLAG_ASYNC = 0x10000000;
pub const FLAG_SECURE = 0x00800000;
pub const FLAG_ESCAPE_PERCENT = 0x00000004;
pub const FLAG_NULL_CODEPAGE = 0x00000008;
pub const FLAG_BYPASS_PROXY_CACHE = 0x00000100;
pub const FLAG_REFRESH = FLAG_BYPASS_PROXY_CACHE;
pub const FLAG_ESCAPE_DISABLE = 0x00000040;
pub const FLAG_ESCAPE_DISABLE_QUERY = 0x00000080;
pub const SECURITY_FLAG_IGNORE_UNKNOWN_CA = 0x00000100;
pub const SECURITY_FLAG_IGNORE_CERT_DATE_INVALID = 0x00002000;
pub const SECURITY_FLAG_IGNORE_CERT_CN_INVALID = 0x00001000;
pub const SECURITY_FLAG_IGNORE_CERT_WRONG_USAGE = 0x00000200;
pub const INTERNET_SCHEME_HTTP = 1;
pub const INTERNET_SCHEME_HTTPS = 2;
pub const INTERNET_SCHEME_FTP = 3;
pub const INTERNET_SCHEME_SOCKS = 4;
pub const AUTOPROXY_AUTO_DETECT = 0x00000001;
pub const AUTOPROXY_CONFIG_URL = 0x00000002;
pub const AUTOPROXY_HOST_KEEPCASE = 0x00000004;
pub const AUTOPROXY_HOST_LOWERCASE = 0x00000008;
pub const AUTOPROXY_ALLOW_AUTOCONFIG = 0x00000100;
pub const AUTOPROXY_ALLOW_STATIC = 0x00000200;
pub const AUTOPROXY_ALLOW_CM = 0x00000400;
pub const AUTOPROXY_RUN_INPROCESS = 0x00010000;
pub const AUTOPROXY_RUN_OUTPROCESS_ONLY = 0x00020000;
pub const AUTOPROXY_NO_DIRECTACCESS = 0x00040000;
pub const AUTOPROXY_NO_CACHE_CLIENT = 0x00080000;
pub const AUTOPROXY_NO_CACHE_SVC = 0x00100000;
pub const AUTOPROXY_SORT_RESULTS = 0x00400000;
pub const AUTO_DETECT_TYPE_DHCP = 0x00000001;
pub const AUTO_DETECT_TYPE_DNS_A = 0x00000002;
pub const NETWORKING_KEY_BUFSIZE = 128;
pub const REQUEST_STAT_FLAG_TCP_FAST_OPEN = 0x00000001;
pub const REQUEST_STAT_FLAG_TLS_SESSION_RESUMPTION = 0x00000002;
pub const REQUEST_STAT_FLAG_TLS_FALSE_START = 0x00000004;
pub const REQUEST_STAT_FLAG_PROXY_TLS_SESSION_RESUMPTION = 0x00000008;
pub const REQUEST_STAT_FLAG_PROXY_TLS_FALSE_START = 0x00000010;
pub const REQUEST_STAT_FLAG_FIRST_REQUEST = 0x00000020;
pub const TIME_FORMAT_BUFSIZE = 62;
pub const FIRST_OPTION = OPTION_CALLBACK;
pub const OPTION_CALLBACK = 1;
pub const OPTION_RESOLVE_TIMEOUT = 2;
pub const OPTION_CONNECT_TIMEOUT = 3;
pub const OPTION_CONNECT_RETRIES = 4;
pub const OPTION_SEND_TIMEOUT = 5;
pub const OPTION_RECEIVE_TIMEOUT = 6;
pub const OPTION_RECEIVE_RESPONSE_TIMEOUT = 7;
pub const OPTION_HANDLE_TYPE = 9;
pub const OPTION_READ_BUFFER_SIZE = 12;
pub const OPTION_WRITE_BUFFER_SIZE = 13;
pub const OPTION_PARENT_HANDLE = 21;
pub const OPTION_EXTENDED_ERROR = 24;
pub const OPTION_SECURITY_FLAGS = 31;
pub const OPTION_SECURITY_CERTIFICATE_STRUCT = 32;
pub const OPTION_URL = 34;
pub const OPTION_SECURITY_KEY_BITNESS = 36;
pub const OPTION_PROXY = 38;
pub const OPTION_PROXY_RESULT_ENTRY = 39;
pub const OPTION_USER_AGENT = 41;
pub const OPTION_CONTEXT_VALUE = 45;
pub const OPTION_CLIENT_CERT_CONTEXT = 47;
pub const OPTION_REQUEST_PRIORITY = 58;
pub const OPTION_HTTP_VERSION = 59;
pub const OPTION_DISABLE_FEATURE = 63;
pub const OPTION_CODEPAGE = 68;
pub const OPTION_MAX_CONNS_PER_SERVER = 73;
pub const OPTION_MAX_CONNS_PER_1_0_SERVER = 74;
pub const OPTION_AUTOLOGON_POLICY = 77;
pub const OPTION_SERVER_CERT_CONTEXT = 78;
pub const OPTION_ENABLE_FEATURE = 79;
pub const OPTION_WORKER_THREAD_COUNT = 80;
pub const OPTION_PASSPORT_COBRANDING_TEXT = 81;
pub const OPTION_PASSPORT_COBRANDING_URL = 82;
pub const OPTION_CONFIGURE_PASSPORT_AUTH = 83;
pub const OPTION_SECURE_PROTOCOLS = 84;
pub const OPTION_ENABLETRACING = 85;
pub const OPTION_PASSPORT_SIGN_OUT = 86;
pub const OPTION_PASSPORT_RETURN_URL = 87;
pub const OPTION_REDIRECT_POLICY = 88;
pub const OPTION_MAX_HTTP_AUTOMATIC_REDIRECTS = 89;
pub const OPTION_MAX_HTTP_STATUS_CONTINUE = 90;
pub const OPTION_MAX_RESPONSE_HEADER_SIZE = 91;
pub const OPTION_MAX_RESPONSE_DRAIN_SIZE = 92;
pub const OPTION_CONNECTION_INFO = 93;
pub const OPTION_CLIENT_CERT_ISSUER_LIST = 94;
pub const OPTION_SPN = 96;
pub const OPTION_GLOBAL_PROXY_CREDS = 97;
pub const OPTION_GLOBAL_SERVER_CREDS = 98;
pub const OPTION_UNLOAD_NOTIFY_EVENT = 99;
pub const OPTION_REJECT_USERPWD_IN_URL = 100;
pub const OPTION_USE_GLOBAL_SERVER_CREDENTIALS = 101;
pub const OPTION_RECEIVE_PROXY_CONNECT_RESPONSE = 103;
pub const OPTION_IS_PROXY_CONNECT_RESPONSE = 104;
pub const OPTION_SERVER_SPN_USED = 106;
pub const OPTION_PROXY_SPN_USED = 107;
pub const OPTION_SERVER_CBT = 108;
pub const OPTION_UNSAFE_HEADER_PARSING = 110;
pub const OPTION_ASSURED_NON_BLOCKING_CALLBACKS = 111;
pub const OPTION_UPGRADE_TO_WEB_SOCKET = 114;
pub const OPTION_WEB_SOCKET_CLOSE_TIMEOUT = 115;
pub const OPTION_WEB_SOCKET_KEEPALIVE_INTERVAL = 116;
pub const OPTION_DECOMPRESSION = 118;
pub const OPTION_WEB_SOCKET_RECEIVE_BUFFER_SIZE = 122;
pub const OPTION_WEB_SOCKET_SEND_BUFFER_SIZE = 123;
pub const OPTION_TCP_PRIORITY_HINT = 128;
pub const OPTION_CONNECTION_FILTER = 131;
pub const OPTION_ENABLE_HTTP_PROTOCOL = 133;
pub const OPTION_HTTP_PROTOCOL_USED = 134;
pub const OPTION_KDC_PROXY_SETTINGS = 136;
pub const OPTION_ENCODE_EXTRA = 138;
pub const OPTION_DISABLE_STREAM_QUEUE = 139;
pub const OPTION_IPV6_FAST_FALLBACK = 140;
pub const OPTION_CONNECTION_STATS_V0 = 141;
pub const OPTION_REQUEST_TIMES = 142;
pub const OPTION_EXPIRE_CONNECTION = 143;
pub const OPTION_DISABLE_SECURE_PROTOCOL_FALLBACK = 144;
pub const OPTION_HTTP_PROTOCOL_REQUIRED = 145;
pub const OPTION_REQUEST_STATS = 146;
pub const OPTION_SERVER_CERT_CHAIN_CONTEXT = 147;
pub const LAST_OPTION = OPTION_SERVER_CERT_CHAIN_CONTEXT;
pub const OPTION_USERNAME = 0x1000;
pub const OPTION_PASSWORD = 0x1001;
pub const OPTION_PROXY_USERNAME = 0x1002;
pub const OPTION_PROXY_PASSWORD = 0x1003;
pub const CONNS_PER_SERVER_UNLIMITED = 0xFFFFFFFF;
pub const DECOMPRESSION_FLAG_GZIP = 0x00000001;
pub const DECOMPRESSION_FLAG_DEFLATE = 0x00000002;
pub const DECOMPRESSION_FLAG_ALL = DECOMPRESSION_FLAG_GZIP | DECOMPRESSION_FLAG_DEFLATE;
pub const PROTOCOL_FLAG_HTTP2 = 0x1;
pub const PROTOCOL_MASK = PROTOCOL_FLAG_HTTP2;
pub const AUTOLOGON_SECURITY_LEVEL_MEDIUM = 0;
pub const AUTOLOGON_SECURITY_LEVEL_LOW = 1;
pub const AUTOLOGON_SECURITY_LEVEL_HIGH = 2;
pub const AUTOLOGON_SECURITY_LEVEL_DEFAULT = AUTOLOGON_SECURITY_LEVEL_MEDIUM;
pub const OPTION_REDIRECT_POLICY_NEVER = 0;
pub const OPTION_REDIRECT_POLICY_DISALLOW_HTTPS_TO_HTTP = 1;
pub const OPTION_REDIRECT_POLICY_ALWAYS = 2;
pub const OPTION_REDIRECT_POLICY_LAST = OPTION_REDIRECT_POLICY_ALWAYS;
pub const OPTION_REDIRECT_POLICY_DEFAULT = OPTION_REDIRECT_POLICY_DISALLOW_HTTPS_TO_HTTP;
pub const DISABLE_PASSPORT_AUTH = 0x00000000;
pub const ENABLE_PASSPORT_AUTH = 0x10000000;
pub const DISABLE_PASSPORT_KEYRING = 0x20000000;
pub const ENABLE_PASSPORT_KEYRING = 0x40000000;
pub const DISABLE_COOKIES = 0x00000001;
pub const DISABLE_REDIRECTS = 0x00000002;
pub const DISABLE_AUTHENTICATION = 0x00000004;
pub const DISABLE_KEEP_ALIVE = 0x00000008;
pub const ENABLE_SSL_REVOCATION = 0x00000001;
pub const ENABLE_SSL_REVERT_IMPERSONATION = 0x00000002;
pub const DISABLE_SPN_SERVER_PORT = 0x00000000;
pub const ENABLE_SPN_SERVER_PORT = 0x00000001;
pub const OPTION_SPN_MASK = ENABLE_SPN_SERVER_PORT;
pub const HANDLE_TYPE_SESSION = 1;
pub const HANDLE_TYPE_CONNECT = 2;
pub const HANDLE_TYPE_REQUEST = 3;
pub const AUTH_SCHEME_BASIC = 0x00000001;
pub const AUTH_SCHEME_NTLM = 0x00000002;
pub const AUTH_SCHEME_PASSPORT = 0x00000004;
pub const AUTH_SCHEME_DIGEST = 0x00000008;
pub const AUTH_SCHEME_NEGOTIATE = 0x00000010;
pub const AUTH_TARGET_SERVER = 0x00000000;
pub const AUTH_TARGET_PROXY = 0x00000001;
pub const SECURITY_FLAG_SECURE = 0x00000001;
pub const SECURITY_FLAG_STRENGTH_WEAK = 0x10000000;
pub const SECURITY_FLAG_STRENGTH_MEDIUM = 0x40000000;
pub const SECURITY_FLAG_STRENGTH_STRONG = 0x20000000;
pub const CALLBACK_STATUS_FLAG_CERT_REV_FAILED = 0x00000001;
pub const CALLBACK_STATUS_FLAG_INVALID_CERT = 0x00000002;
pub const CALLBACK_STATUS_FLAG_CERT_REVOKED = 0x00000004;
pub const CALLBACK_STATUS_FLAG_INVALID_CA = 0x00000008;
pub const CALLBACK_STATUS_FLAG_CERT_CN_INVALID = 0x00000010;
pub const CALLBACK_STATUS_FLAG_CERT_DATE_INVALID = 0x00000020;
pub const CALLBACK_STATUS_FLAG_CERT_WRONG_USAGE = 0x00000040;
pub const CALLBACK_STATUS_FLAG_SECURITY_CHANNEL_ERROR = 0x80000000;
pub const FLAG_SECURE_PROTOCOL_SSL2 = 0x00000008;
pub const FLAG_SECURE_PROTOCOL_SSL3 = 0x00000020;
pub const FLAG_SECURE_PROTOCOL_TLS1 = 0x00000080;
pub const FLAG_SECURE_PROTOCOL_TLS1_1 = 0x00000200;
pub const FLAG_SECURE_PROTOCOL_TLS1_2 = 0x00000800;
pub const FLAG_SECURE_PROTOCOL_TLS1_3 = 0x00002000;
pub const FLAG_SECURE_PROTOCOL_ALL = (FLAG_SECURE_PROTOCOL_SSL2 | FLAG_SECURE_PROTOCOL_SSL3) | FLAG_SECURE_PROTOCOL_TLS1;
pub const CALLBACK_STATUS_RESOLVING_NAME = 0x00000001;
pub const CALLBACK_STATUS_NAME_RESOLVED = 0x00000002;
pub const CALLBACK_STATUS_CONNECTING_TO_SERVER = 0x00000004;
pub const CALLBACK_STATUS_CONNECTED_TO_SERVER = 0x00000008;
pub const CALLBACK_STATUS_SENDING_REQUEST = 0x00000010;
pub const CALLBACK_STATUS_REQUEST_SENT = 0x00000020;
pub const CALLBACK_STATUS_RECEIVING_RESPONSE = 0x00000040;
pub const CALLBACK_STATUS_RESPONSE_RECEIVED = 0x00000080;
pub const CALLBACK_STATUS_CLOSING_CONNECTION = 0x00000100;
pub const CALLBACK_STATUS_CONNECTION_CLOSED = 0x00000200;
pub const CALLBACK_STATUS_HANDLE_CREATED = 0x00000400;
pub const CALLBACK_STATUS_HANDLE_CLOSING = 0x00000800;
pub const CALLBACK_STATUS_DETECTING_PROXY = 0x00001000;
pub const CALLBACK_STATUS_REDIRECT = 0x00004000;
pub const CALLBACK_STATUS_INTERMEDIATE_RESPONSE = 0x00008000;
pub const CALLBACK_STATUS_SECURE_FAILURE = 0x00010000;
pub const CALLBACK_STATUS_HEADERS_AVAILABLE = 0x00020000;
pub const CALLBACK_STATUS_DATA_AVAILABLE = 0x00040000;
pub const CALLBACK_STATUS_READ_COMPLETE = 0x00080000;
pub const CALLBACK_STATUS_WRITE_COMPLETE = 0x00100000;
pub const CALLBACK_STATUS_REQUEST_ERROR = 0x00200000;
pub const CALLBACK_STATUS_SENDREQUEST_COMPLETE = 0x00400000;
pub const CALLBACK_STATUS_GETPROXYFORURL_COMPLETE = 0x01000000;
pub const CALLBACK_STATUS_CLOSE_COMPLETE = 0x02000000;
pub const CALLBACK_STATUS_SHUTDOWN_COMPLETE = 0x04000000;
pub const CALLBACK_STATUS_SETTINGS_WRITE_COMPLETE = 0x10000000;
pub const CALLBACK_STATUS_SETTINGS_READ_COMPLETE = 0x20000000;
pub const API_RECEIVE_RESPONSE = 1;
pub const API_QUERY_DATA_AVAILABLE = 2;
pub const API_READ_DATA = 3;
pub const API_WRITE_DATA = 4;
pub const API_SEND_REQUEST = 5;
pub const API_GET_PROXY_FOR_URL = 6;
pub const CALLBACK_FLAG_RESOLVE_NAME = CALLBACK_STATUS_RESOLVING_NAME | CALLBACK_STATUS_NAME_RESOLVED;
pub const CALLBACK_FLAG_CONNECT_TO_SERVER = CALLBACK_STATUS_CONNECTING_TO_SERVER | CALLBACK_STATUS_CONNECTED_TO_SERVER;
pub const CALLBACK_FLAG_SEND_REQUEST = CALLBACK_STATUS_SENDING_REQUEST | CALLBACK_STATUS_REQUEST_SENT;
pub const CALLBACK_FLAG_RECEIVE_RESPONSE = CALLBACK_STATUS_RECEIVING_RESPONSE | CALLBACK_STATUS_RESPONSE_RECEIVED;
pub const CALLBACK_FLAG_CLOSE_CONNECTION = CALLBACK_STATUS_CLOSING_CONNECTION | CALLBACK_STATUS_CONNECTION_CLOSED;
pub const CALLBACK_FLAG_HANDLES = CALLBACK_STATUS_HANDLE_CREATED | CALLBACK_STATUS_HANDLE_CLOSING;
pub const CALLBACK_FLAG_DETECTING_PROXY = CALLBACK_STATUS_DETECTING_PROXY;
pub const CALLBACK_FLAG_REDIRECT = CALLBACK_STATUS_REDIRECT;
pub const CALLBACK_FLAG_INTERMEDIATE_RESPONSE = CALLBACK_STATUS_INTERMEDIATE_RESPONSE;
pub const CALLBACK_FLAG_SECURE_FAILURE = CALLBACK_STATUS_SECURE_FAILURE;
pub const CALLBACK_FLAG_SENDREQUEST_COMPLETE = CALLBACK_STATUS_SENDREQUEST_COMPLETE;
pub const CALLBACK_FLAG_HEADERS_AVAILABLE = CALLBACK_STATUS_HEADERS_AVAILABLE;
pub const CALLBACK_FLAG_DATA_AVAILABLE = CALLBACK_STATUS_DATA_AVAILABLE;
pub const CALLBACK_FLAG_READ_COMPLETE = CALLBACK_STATUS_READ_COMPLETE;
pub const CALLBACK_FLAG_WRITE_COMPLETE = CALLBACK_STATUS_WRITE_COMPLETE;
pub const CALLBACK_FLAG_REQUEST_ERROR = CALLBACK_STATUS_REQUEST_ERROR;
pub const CALLBACK_FLAG_GETPROXYFORURL_COMPLETE = CALLBACK_STATUS_GETPROXYFORURL_COMPLETE;
pub const CALLBACK_FLAG_ALL_COMPLETIONS = (((((CALLBACK_STATUS_SENDREQUEST_COMPLETE | CALLBACK_STATUS_HEADERS_AVAILABLE) | CALLBACK_STATUS_DATA_AVAILABLE) | CALLBACK_STATUS_READ_COMPLETE) | CALLBACK_STATUS_WRITE_COMPLETE) | CALLBACK_STATUS_REQUEST_ERROR) | CALLBACK_STATUS_GETPROXYFORURL_COMPLETE;
pub const CALLBACK_FLAG_ALL_NOTIFICATIONS = 0xffffffff;
pub const INVALID_STATUS_CALLBACK = (@import("std").meta.cast(STATUS_CALLBACK, -@as(c_long, 1)));
pub const QUERY_MIME_VERSION = 0;
pub const QUERY_CONTENT_TYPE = 1;
pub const QUERY_CONTENT_TRANSFER_ENCODING = 2;
pub const QUERY_CONTENT_ID = 3;
pub const QUERY_CONTENT_DESCRIPTION = 4;
pub const QUERY_CONTENT_LENGTH = 5;
pub const QUERY_CONTENT_LANGUAGE = 6;
pub const QUERY_ALLOW = 7;
pub const QUERY_PUBLIC = 8;
pub const QUERY_DATE = 9;
pub const QUERY_EXPIRES = 10;
pub const QUERY_LAST_MODIFIED = 11;
pub const QUERY_MESSAGE_ID = 12;
pub const QUERY_URI = 13;
pub const QUERY_DERIVED_FROM = 14;
pub const QUERY_COST = 15;
pub const QUERY_LINK = 16;
pub const QUERY_PRAGMA = 17;
pub const QUERY_VERSION = 18;
pub const QUERY_STATUS_CODE = 19;
pub const QUERY_STATUS_TEXT = 20;
pub const QUERY_RAW_HEADERS = 21;
pub const QUERY_RAW_HEADERS_CRLF = 22;
pub const QUERY_CONNECTION = 23;
pub const QUERY_ACCEPT = 24;
pub const QUERY_ACCEPT_CHARSET = 25;
pub const QUERY_ACCEPT_ENCODING = 26;
pub const QUERY_ACCEPT_LANGUAGE = 27;
pub const QUERY_AUTHORIZATION = 28;
pub const QUERY_CONTENT_ENCODING = 29;
pub const QUERY_FORWARDED = 30;
pub const QUERY_FROM = 31;
pub const QUERY_IF_MODIFIED_SINCE = 32;
pub const QUERY_LOCATION = 33;
pub const QUERY_ORIG_URI = 34;
pub const QUERY_REFERER = 35;
pub const QUERY_RETRY_AFTER = 36;
pub const QUERY_SERVER = 37;
pub const QUERY_TITLE = 38;
pub const QUERY_USER_AGENT = 39;
pub const QUERY_WWW_AUTHENTICATE = 40;
pub const QUERY_PROXY_AUTHENTICATE = 41;
pub const QUERY_ACCEPT_RANGES = 42;
pub const QUERY_SET_COOKIE = 43;
pub const QUERY_COOKIE = 44;
pub const QUERY_REQUEST_METHOD = 45;
pub const QUERY_REFRESH = 46;
pub const QUERY_CONTENT_DISPOSITION = 47;
pub const QUERY_AGE = 48;
pub const QUERY_CACHE_CONTROL = 49;
pub const QUERY_CONTENT_BASE = 50;
pub const QUERY_CONTENT_LOCATION = 51;
pub const QUERY_CONTENT_MD5 = 52;
pub const QUERY_CONTENT_RANGE = 53;
pub const QUERY_ETAG = 54;
pub const QUERY_HOST = 55;
pub const QUERY_IF_MATCH = 56;
pub const QUERY_IF_NONE_MATCH = 57;
pub const QUERY_IF_RANGE = 58;
pub const QUERY_IF_UNMODIFIED_SINCE = 59;
pub const QUERY_MAX_FORWARDS = 60;
pub const QUERY_PROXY_AUTHORIZATION = 61;
pub const QUERY_RANGE = 62;
pub const QUERY_TRANSFER_ENCODING = 63;
pub const QUERY_UPGRADE = 64;
pub const QUERY_VARY = 65;
pub const QUERY_VIA = 66;
pub const QUERY_WARNING = 67;
pub const QUERY_EXPECT = 68;
pub const QUERY_PROXY_CONNECTION = 69;
pub const QUERY_UNLESS_MODIFIED_SINCE = 70;
pub const QUERY_PROXY_SUPPORT = 75;
pub const QUERY_AUTHENTICATION_INFO = 76;
pub const QUERY_PASSPORT_URLS = 77;
pub const QUERY_PASSPORT_CONFIG = 78;
pub const QUERY_MAX = 78;
pub const QUERY_CUSTOM = 65535;
pub const QUERY_FLAG_REQUEST_HEADERS = 0x80000000;
pub const QUERY_FLAG_SYSTEMTIME = 0x40000000;
pub const QUERY_FLAG_NUMBER = 0x20000000;
pub const QUERY_FLAG_NUMBER64 = 0x08000000;
pub const HTTP_STATUS_CONTINUE = 100;
pub const HTTP_STATUS_SWITCH_PROTOCOLS = 101;
pub const HTTP_STATUS_OK = 200;
pub const HTTP_STATUS_CREATED = 201;
pub const HTTP_STATUS_ACCEPTED = 202;
pub const HTTP_STATUS_PARTIAL = 203;
pub const HTTP_STATUS_NO_CONTENT = 204;
pub const HTTP_STATUS_RESET_CONTENT = 205;
pub const HTTP_STATUS_PARTIAL_CONTENT = 206;
pub const HTTP_STATUS_WEBDAV_MULTI_STATUS = 207;
pub const HTTP_STATUS_AMBIGUOUS = 300;
pub const HTTP_STATUS_MOVED = 301;
pub const HTTP_STATUS_REDIRECT = 302;
pub const HTTP_STATUS_REDIRECT_METHOD = 303;
pub const HTTP_STATUS_NOT_MODIFIED = 304;
pub const HTTP_STATUS_USE_PROXY = 305;
pub const HTTP_STATUS_REDIRECT_KEEP_VERB = 307;
pub const HTTP_STATUS_PERMANENT_REDIRECT = 308;
pub const HTTP_STATUS_BAD_REQUEST = 400;
pub const HTTP_STATUS_DENIED = 401;
pub const HTTP_STATUS_PAYMENT_REQ = 402;
pub const HTTP_STATUS_FORBIDDEN = 403;
pub const HTTP_STATUS_NOT_FOUND = 404;
pub const HTTP_STATUS_BAD_METHOD = 405;
pub const HTTP_STATUS_NONE_ACCEPTABLE = 406;
pub const HTTP_STATUS_PROXY_AUTH_REQ = 407;
pub const HTTP_STATUS_REQUEST_TIMEOUT = 408;
pub const HTTP_STATUS_CONFLICT = 409;
pub const HTTP_STATUS_GONE = 410;
pub const HTTP_STATUS_LENGTH_REQUIRED = 411;
pub const HTTP_STATUS_PRECOND_FAILED = 412;
pub const HTTP_STATUS_REQUEST_TOO_LARGE = 413;
pub const HTTP_STATUS_URI_TOO_LONG = 414;
pub const HTTP_STATUS_UNSUPPORTED_MEDIA = 415;
pub const HTTP_STATUS_RETRY_WITH = 449;
pub const HTTP_STATUS_SERVER_ERROR = 500;
pub const HTTP_STATUS_NOT_SUPPORTED = 501;
pub const HTTP_STATUS_BAD_GATEWAY = 502;
pub const HTTP_STATUS_SERVICE_UNAVAIL = 503;
pub const HTTP_STATUS_GATEWAY_TIMEOUT = 504;
pub const HTTP_STATUS_VERSION_NOT_SUP = 505;
pub const HTTP_STATUS_FIRST = HTTP_STATUS_CONTINUE;
pub const HTTP_STATUS_LAST = HTTP_STATUS_VERSION_NOT_SUP;
pub const ICU_NO_ENCODE = 0x20000000;
pub const ICU_DECODE = 0x10000000;
pub const ICU_NO_META = 0x08000000;
pub const ICU_ENCODE_SPACES_ONLY = 0x04000000;
pub const ICU_BROWSER_MODE = 0x02000000;
pub const ICU_ENCODE_PERCENT = 0x00001000;
pub const ICU_ESCAPE = 0x80000000;
pub const ICU_ESCAPE_AUTHORITY = 0x00002000;
pub const ICU_REJECT_USERPWD = 0x00004000;
pub const ACCESS_TYPE_DEFAULT_PROXY = 0;
pub const ACCESS_TYPE_NO_PROXY = 1;
pub const ACCESS_TYPE_NAMED_PROXY = 3;
pub const ACCESS_TYPE_AUTOMATIC_PROXY = 4;
pub const NO_PROXY_NAME: LPCWSTR = null;
pub const NO_PROXY_BYPASS: LPCWSTR = null;
pub const NO_CLIENT_CERT_CONTEXT: LPCWSTR = null;
pub const NO_REFERER: LPCWSTR = null;
pub const DEFAULT_ACCEPT_TYPES: ?[*:null]const LPCWSTR = null;
pub const ADDREQ_INDEX_MASK = 0x0000FFFF;
pub const ADDREQ_FLAGS_MASK = 0xFFFF0000;
pub const ADDREQ_FLAG_ADD_IF_NEW = 0x10000000;
pub const ADDREQ_FLAG_ADD = 0x20000000;
pub const ADDREQ_FLAG_COALESCE_WITH_COMMA = 0x40000000;
pub const ADDREQ_FLAG_COALESCE_WITH_SEMICOLON = 0x01000000;
pub const ADDREQ_FLAG_COALESCE = ADDREQ_FLAG_COALESCE_WITH_COMMA;
pub const ADDREQ_FLAG_REPLACE = 0x80000000;
pub const IGNORE_REQUEST_TOTAL_LENGTH = 0;
pub const NO_ADDITIONAL_HEADERS: LPCWSTR = null;
pub const NO_REQUEST_DATA: LPVOID = null;
pub const HEADER_NAME_BY_INDEX: LPCWSTR = null;
pub const NO_OUTPUT_BUFFER: LPVOID = null;
pub const NO_HEADER_INDEX: LPDWORD = null;
pub const ERROR_BASE = 12000;
pub const ERROR_OUT_OF_HANDLES = ERROR_BASE + 1;
pub const ERROR_TIMEOUT = ERROR_BASE + 2;
pub const ERROR_INTERNAL_ERROR = ERROR_BASE + 4;
pub const ERROR_INVALID_URL = ERROR_BASE + 5;
pub const ERROR_UNRECOGNIZED_SCHEME = ERROR_BASE + 6;
pub const ERROR_NAME_NOT_RESOLVED = ERROR_BASE + 7;
pub const ERROR_INVALID_OPTION = ERROR_BASE + 9;
pub const ERROR_OPTION_NOT_SETTABLE = ERROR_BASE + 11;
pub const ERROR_SHUTDOWN = ERROR_BASE + 12;
pub const ERROR_LOGIN_FAILURE = ERROR_BASE + 15;
pub const ERROR_OPERATION_CANCELLED = ERROR_BASE + 17;
pub const ERROR_INCORRECT_HANDLE_TYPE = ERROR_BASE + 18;
pub const ERROR_INCORRECT_HANDLE_STATE = ERROR_BASE + 19;
pub const ERROR_CANNOT_CONNECT = ERROR_BASE + 29;
pub const ERROR_CONNECTION_ERROR = ERROR_BASE + 30;
pub const ERROR_RESEND_REQUEST = ERROR_BASE + 32;
pub const ERROR_CLIENT_AUTH_CERT_NEEDED = ERROR_BASE + 44;
pub const ERROR_CANNOT_CALL_BEFORE_OPEN = ERROR_BASE + 100;
pub const ERROR_CANNOT_CALL_BEFORE_SEND = ERROR_BASE + 101;
pub const ERROR_CANNOT_CALL_AFTER_SEND = ERROR_BASE + 102;
pub const ERROR_CANNOT_CALL_AFTER_OPEN = ERROR_BASE + 103;
pub const ERROR_HEADER_NOT_FOUND = ERROR_BASE + 150;
pub const ERROR_INVALID_SERVER_RESPONSE = ERROR_BASE + 152;
pub const ERROR_INVALID_HEADER = ERROR_BASE + 153;
pub const ERROR_INVALID_QUERY_REQUEST = ERROR_BASE + 154;
pub const ERROR_HEADER_ALREADY_EXISTS = ERROR_BASE + 155;
pub const ERROR_REDIRECT_FAILED = ERROR_BASE + 156;
pub const ERROR_AUTO_PROXY_SERVICE_ERROR = ERROR_BASE + 178;
pub const ERROR_BAD_AUTO_PROXY_SCRIPT = ERROR_BASE + 166;
pub const ERROR_UNABLE_TO_DOWNLOAD_SCRIPT = ERROR_BASE + 167;
pub const ERROR_UNHANDLED_SCRIPT_TYPE = ERROR_BASE + 176;
pub const ERROR_SCRIPT_EXECUTION_ERROR = ERROR_BASE + 177;
pub const ERROR_NOT_INITIALIZED = ERROR_BASE + 172;
pub const ERROR_SECURE_FAILURE = ERROR_BASE + 175;
pub const ERROR_SECURE_CERT_DATE_INVALID = ERROR_BASE + 37;
pub const ERROR_SECURE_CERT_CN_INVALID = ERROR_BASE + 38;
pub const ERROR_SECURE_INVALID_CA = ERROR_BASE + 45;
pub const ERROR_SECURE_CERT_REV_FAILED = ERROR_BASE + 57;
pub const ERROR_SECURE_CHANNEL_ERROR = ERROR_BASE + 157;
pub const ERROR_SECURE_INVALID_CERT = ERROR_BASE + 169;
pub const ERROR_SECURE_CERT_REVOKED = ERROR_BASE + 170;
pub const ERROR_SECURE_CERT_WRONG_USAGE = ERROR_BASE + 179;
pub const ERROR_AUTODETECTION_FAILED = ERROR_BASE + 180;
pub const ERROR_HEADER_COUNT_EXCEEDED = ERROR_BASE + 181;
pub const ERROR_HEADER_SIZE_OVERFLOW = ERROR_BASE + 182;
pub const ERROR_CHUNKED_ENCODING_HEADER_SIZE_OVERFLOW = ERROR_BASE + 183;
pub const ERROR_RESPONSE_DRAIN_OVERFLOW = ERROR_BASE + 184;
pub const ERROR_CLIENT_CERT_NO_PRIVATE_KEY = ERROR_BASE + 185;
pub const ERROR_CLIENT_CERT_NO_ACCESS_PRIVATE_KEY = ERROR_BASE + 186;
pub const ERROR_CLIENT_AUTH_CERT_NEEDED_PROXY = ERROR_BASE + 187;
pub const ERROR_SECURE_FAILURE_PROXY = ERROR_BASE + 188;
pub const ERROR_RESERVED_189 = ERROR_BASE + 189;
pub const ERROR_HTTP_PROTOCOL_MISMATCH = ERROR_BASE + 190;
pub const ERROR_LAST = ERROR_BASE + 188;
pub const RESET_STATE = 0x00000001;
pub const RESET_SWPAD_CURRENT_NETWORK = 0x00000002;
pub const RESET_SWPAD_ALL = 0x00000004;
pub const RESET_SCRIPT_CACHE = 0x00000008;
pub const RESET_ALL = 0x0000FFFF;
pub const RESET_NOTIFY_NETWORK_CHANGED = 0x00010000;
pub const RESET_OUT_OF_PROC = 0x00020000;
pub const RESET_DISCARD_RESOLVERS = 0x00040000;
pub const WEB_SOCKET_MAX_CLOSE_REASON_LENGTH = 123;
pub const WEB_SOCKET_MIN_KEEPALIVE_VALUE = 15000;

pub const HINTERNET = LPVOID;
pub const LPHINTERNET = [*c]HINTERNET;
pub const INTERNET_PORT = WORD;
pub const LPINTERNET_PORT = [*c]INTERNET_PORT;

pub const ASYNC_RESULT = extern struct {
    dwResult: DWORD_PTR,
    dwError: DWORD,
};
pub const LPASYNC_RESULT = [*c]ASYNC_RESULT;

pub const HTTP_VERSION_INFO = extern struct {
    dwMajorVersion: DWORD,
    dwMinorVersion: DWORD,
};
pub const LPHTTP_VERSION_INFO = [*c]HTTP_VERSION_INFO;

pub const INTERNET_SCHEME = c_int;
pub const LPINTERNET_SCHEME = [*c]c_int;

pub const URL_COMPONENTS = extern struct {
    dwStructSize: DWORD,
    lpszScheme: LPWSTR,
    dwSchemeLength: DWORD,
    nScheme: INTERNET_SCHEME,
    lpszHostName: LPWSTR,
    dwHostNameLength: DWORD,
    nPort: INTERNET_PORT,
    lpszUserName: LPWSTR,
    dwUserNameLength: DWORD,
    lpszPassword: LPWSTR,
    dwPasswordLength: DWORD,
    lpszUrlPath: LPWSTR,
    dwUrlPathLength: DWORD,
    lpszExtraInfo: LPWSTR,
    dwExtraInfoLength: DWORD,
};
pub const LPURL_COMPONENTS = [*c]URL_COMPONENTS;

pub const URL_COMPONENTSW = URL_COMPONENTS;
pub const LPURL_COMPONENTSW = LPURL_COMPONENTS;

pub const PROXY_INFO = extern struct {
    dwAccessType: DWORD,
    lpszProxy: LPWSTR,
    lpszProxyBypass: LPWSTR,
};
pub const LPPROXY_INFO = [*c]PROXY_INFO;

pub const PROXY_INFOW = PROXY_INFO;
pub const LPPROXY_INFOW = LPPROXY_INFO;

pub const AUTOPROXY_OPTIONS = extern struct {
    dwFlags: DWORD,
    dwAutoDetectFlags: DWORD,
    lpszAutoConfigUrl: LPCWSTR,
    lpvReserved: LPVOID,
    dwReserved: DWORD,
    fAutoLogonIfChallenged: BOOL,
};

pub const PROXY_RESULT_ENTRY = extern struct {
    fProxy: BOOL,
    fBypass: BOOL,
    ProxyScheme: INTERNET_SCHEME,
    pwszProxy: PWSTR,
    ProxyPort: INTERNET_PORT,
};

pub const PROXY_RESULT = extern struct {
    cEntries: DWORD,
    pEntries: [*c]PROXY_RESULT_ENTRY,
};
pub const PROXY_RESULT_EX = extern struct {
    cEntries: DWORD,
    pEntries: [*c]PROXY_RESULT_ENTRY,
    hProxyDetectionHandle: HANDLE,
    dwProxyInterfaceAffinity: DWORD,
};
pub const PROXY_NETWORKING_KEY = extern struct {
    pbBuffer: [128]u8,
};
pub const PPROXY_NETWORKING_KEY = [*c]PROXY_NETWORKING_KEY;

pub const PROXY_SETTINGS = extern struct {
    dwStructSize: DWORD,
    dwFlags: DWORD,
    dwCurrentSettingsVersion: DWORD,
    pwszConnectionName: PWSTR,
    pwszProxy: PWSTR,
    pwszProxyBypass: PWSTR,
    pwszAutoconfigUrl: PWSTR,
    pwszAutoconfigSecondaryUrl: PWSTR,
    dwAutoDiscoveryFlags: DWORD,
    pwszLastKnownGoodAutoConfigUrl: PWSTR,
    dwAutoconfigReloadDelayMins: DWORD,
    ftLastKnownDetectTime: FILETIME,
    dwDetectedInterfaceIpCount: DWORD,
    pdwDetectedInterfaceIp: PDWORD,
    cNetworkKeys: DWORD,
    pNetworkKeys: PPROXY_NETWORKING_KEY,
};
pub const PPROXY_SETTINGS = [*c]PROXY_SETTINGS;
pub const CERTIFICATE_INFO = extern struct {
    ftExpiry: FILETIME,
    ftStart: FILETIME,
    lpszSubjectInfo: LPWSTR,
    lpszIssuerInfo: LPWSTR,
    lpszProtocolName: LPWSTR,
    lpszSignatureAlgName: LPWSTR,
    lpszEncryptionAlgName: LPWSTR,
    dwKeySize: DWORD,
};
pub const REQUEST_TIME_ENTRY = enum(c_int) {
    ProxyDetectionStart = 0,
    ProxyDetectionEnd = 1,
    ConnectionAcquireStart = 2,
    ConnectionAcquireWaitEnd = 3,
    ConnectionAcquireEnd = 4,
    NameResolutionStart = 5,
    NameResolutionEnd = 6,
    ConnectionEstablishmentStart = 7,
    ConnectionEstablishmentEnd = 8,
    TlsHandshakeClientLeg1Start = 9,
    TlsHandshakeClientLeg1End = 10,
    TlsHandshakeClientLeg2Start = 11,
    TlsHandshakeClientLeg2End = 12,
    TlsHandshakeClientLeg3Start = 13,
    TlsHandshakeClientLeg3End = 14,
    StreamWaitStart = 15,
    StreamWaitEnd = 16,
    SendRequestStart = 17,
    SendRequestHeadersCompressionStart = 18,
    SendRequestHeadersCompressionEnd = 19,
    SendRequestHeadersEnd = 20,
    SendRequestEnd = 21,
    ReceiveResponseStart = 22,
    ReceiveResponseHeadersDecompressionStart = 23,
    ReceiveResponseHeadersDecompressionEnd = 24,
    ReceiveResponseHeadersEnd = 25,
    ReceiveResponseBodyDecompressionDelta = 26,
    ReceiveResponseEnd = 27,
    ProxyTunnelStart = 28,
    ProxyTunnelEnd = 29,
    ProxyTlsHandshakeClientLeg1Start = 30,
    ProxyTlsHandshakeClientLeg1End = 31,
    ProxyTlsHandshakeClientLeg2Start = 32,
    ProxyTlsHandshakeClientLeg2End = 33,
    ProxyTlsHandshakeClientLeg3Start = 34,
    ProxyTlsHandshakeClientLeg3End = 35,
    RequestTimeLast = 36,
    RequestTimeMax = 64,
    _,
};
pub const REQUEST_TIMES = extern struct {
    cTimes: ULONG,
    rgullTimes: [64]ULONGLONG,
};
pub const PREQUEST_TIMES = [*c]REQUEST_TIMES;

pub const REQUEST_STAT_ENTRY = enum(c_int) {
    ConnectFailureCount = 0,
    ProxyFailureCount = 1,
    TlsHandshakeClientLeg1Size = 2,
    TlsHandshakeServerLeg1Size = 3,
    TlsHandshakeClientLeg2Size = 4,
    TlsHandshakeServerLeg2Size = 5,
    RequestHeadersSize = 6,
    RequestHeadersCompressedSize = 7,
    ResponseHeadersSize = 8,
    ResponseHeadersCompressedSize = 9,
    ResponseBodySize = 10,
    ResponseBodyCompressedSize = 11,
    ProxyTlsHandshakeClientLeg1Size = 12,
    ProxyTlsHandshakeServerLeg1Size = 13,
    ProxyTlsHandshakeClientLeg2Size = 14,
    ProxyTlsHandshakeServerLeg2Size = 15,
    RequestStatLast = 16,
    RequestStatMax = 32,
    _,
};
pub const REQUEST_STATS = extern struct {
    ullFlags: ULONGLONG,
    ulIndex: ULONG,
    cStats: ULONG,
    rgullStats: [32]ULONGLONG,
};
pub const PREQUEST_STATS = [*c]REQUEST_STATS;

pub const CREDS = extern struct {
    lpszUserName: LPSTR,
    lpszPassword: LPSTR,
    lpszRealm: LPSTR,
    dwAuthScheme: DWORD,
    lpszHostName: LPSTR,
    dwPort: DWORD,
};
pub const PCREDS = [*c]CREDS;

pub const CREDS_EX = extern struct {
    lpszUserName: LPSTR,
    lpszPassword: LPSTR,
    lpszRealm: LPSTR,
    dwAuthScheme: DWORD,
    lpszHostName: LPSTR,
    dwPort: DWORD,
    lpszUrl: LPSTR,
};
pub const PCREDS_EX = [*c]CREDS_EX;

pub const STATUS_CALLBACK = ?fn (HINTERNET, DWORD_PTR, DWORD, LPVOID, DWORD) callconv(.C) void;
pub const LPSTATUS_CALLBACK = [*c]STATUS_CALLBACK;

pub const CURRENT_USER_IE_PROXY_CONFIG = extern struct {
    fAutoDetect: BOOL,
    lpszAutoConfigUrl: LPWSTR,
    lpszProxy: LPWSTR,
    lpszProxyBypass: LPWSTR,
};

pub const WEB_SOCKET_OPERATION = enum(c_int) {
    SEND = 0,
    RECEIVE = 1,
    CLOSE = 2,
    SHUTDOWN = 3,
    _,
};

pub const WEB_SOCKET_BUFFER_TYPE = enum(c_int) {
    BINARY_MESSAGE = 0,
    BINARY_FRAGMENT = 1,
    UTF8_MESSAGE = 2,
    UTF8_FRAGMENT = 3,
    CLOSE = 4,
    _,
};

pub const WEB_SOCKET_CLOSE_STATUS = enum(c_int) {
    SUCCESS = 1000,
    ENDPOINT_TERMINATED = 1001,
    PROTOCOL_ERROR = 1002,
    INVALID_DATA_TYPE = 1003,
    EMPTY = 1005,
    ABORTED = 1006,
    INVALID_PAYLOAD = 1007,
    POLICY_VIOLATION = 1008,
    MESSAGE_TOO_BIG = 1009,
    UNSUPPORTED_EXTENSIONS = 1010,
    SERVER_ERROR = 1011,
    SECURE_HANDSHAKE_ERROR = 1015,
    _,
};

pub const WEB_SOCKET_ASYNC_RESULT = extern struct {
    AsyncResult: ASYNC_RESULT,
    Operation: WEB_SOCKET_OPERATION,
};

pub const WEB_SOCKET_STATUS = extern struct {
    dwBytesTransferred: DWORD,
    eBufferType: WEB_SOCKET_BUFFER_TYPE,
};

pub const SetStatusCallback = raw.WinHttpSetStatusCallback;
pub const TimeFromSystemTime = raw.WinHttpTimeFromSystemTime;
pub const TimeToSystemTime = raw.WinHttpTimeToSystemTime;
pub const CrackUrl = raw.WinHttpCrackUrl;
pub const CreateUrl = raw.WinHttpCreateUrl;
pub const CheckPlatform = raw.WinHttpCheckPlatform;
pub const GetDefaultProxyConfiguration = raw.WinHttpGetDefaultProxyConfiguration;
pub const SetDefaultProxyConfiguration = raw.WinHttpSetDefaultProxyConfiguration;
pub const Open = raw.WinHttpOpen;
pub const CloseHandle = raw.WinHttpCloseHandle;
pub const Connect = raw.WinHttpConnect;
pub const ReadData = raw.WinHttpReadData;
pub const WriteData = raw.WinHttpWriteData;
pub const QueryDataAvailable = raw.WinHttpQueryDataAvailable;
pub const QueryOption = raw.WinHttpQueryOption;
pub const SetOption = raw.WinHttpSetOption;
pub const SetTimeouts = raw.WinHttpSetTimeouts;
pub const IsHostInProxyBypassList = raw.WinHttpIsHostInProxyBypassList;
pub const OpenRequest = raw.WinHttpOpenRequest;
pub const AddRequestHeaders = raw.WinHttpAddRequestHeaders;
pub const SendRequest = raw.WinHttpSendRequest;
pub const SetCredentials = raw.WinHttpSetCredentials;
pub const QueryAuthSchemes = raw.WinHttpQueryAuthSchemes;
pub const QueryAuthParams = raw.WinHttpQueryAuthParams;
pub const ReceiveResponse = raw.WinHttpReceiveResponse;
pub const QueryHeaders = raw.WinHttpQueryHeaders;
pub const DetectAutoProxyConfigUrl = raw.WinHttpDetectAutoProxyConfigUrl;
pub const GetProxyForUrl = raw.WinHttpGetProxyForUrl;
pub const CreateProxyResolver = raw.WinHttpCreateProxyResolver;
pub const GetProxyForUrlEx = raw.WinHttpGetProxyForUrlEx;
pub const GetProxyForUrlEx2 = raw.WinHttpGetProxyForUrlEx2;
pub const GetProxyResult = raw.WinHttpGetProxyResult;
pub const GetProxyResultEx = raw.WinHttpGetProxyResultEx;
pub const FreeProxyResult = raw.WinHttpFreeProxyResult;
pub const FreeProxyResultEx = raw.WinHttpFreeProxyResultEx;
pub const ResetAutoProxy = raw.WinHttpResetAutoProxy;
pub const GetIEProxyConfigForCurrentUser = raw.WinHttpGetIEProxyConfigForCurrentUser;
pub const WriteProxySettings = raw.WinHttpWriteProxySettings;
pub const ReadProxySettings = raw.WinHttpReadProxySettings;
pub const FreeProxySettings = raw.WinHttpFreeProxySettings;
pub const GetProxySettingsVersion = raw.WinHttpGetProxySettingsVersion;

pub const WebSocketCompleteUpgrade = raw.WinHttpWebSocketCompleteUpgrade;
pub const WebSocketSend = raw.WinHttpWebSocketSend;
pub const WebSocketReceive = raw.WinHttpWebSocketReceive;
pub const WebSocketShutdown = raw.WinHttpWebSocketShutdown;
pub const WebSocketClose = raw.WinHttpWebSocketClose;
pub const WebSocketQueryCloseStatus = raw.WinHttpWebSocketQueryCloseStatus;


pub const raw = struct {
    pub extern "winhttp" fn WinHttpSetStatusCallback(hInternet: HINTERNET, lpfnInternetCallback: STATUS_CALLBACK, dwNotificationFlags: DWORD, dwReserved: DWORD_PTR) STATUS_CALLBACK;
    pub extern "winhttp" fn WinHttpTimeFromSystemTime(pst: [*c]const SYSTEMTIME, pwszTime: LPWSTR) BOOL;
    pub extern "winhttp" fn WinHttpTimeToSystemTime(pwszTime: LPCWSTR, pst: [*c]SYSTEMTIME) BOOL;
    pub extern "winhttp" fn WinHttpCrackUrl(pwszUrl: LPCWSTR, dwUrlLength: DWORD, dwFlags: DWORD, lpUrlComponents: LPURL_COMPONENTS) BOOL;
    pub extern "winhttp" fn WinHttpCreateUrl(lpUrlComponents: LPURL_COMPONENTS, dwFlags: DWORD, pwszUrl: LPWSTR, pdwUrlLength: LPDWORD) BOOL;
    pub extern "winhttp" fn WinHttpCheckPlatform() BOOL;
    pub extern "winhttp" fn WinHttpGetDefaultProxyConfiguration(pProxyInfo: [*c]PROXY_INFO) BOOL;
    pub extern "winhttp" fn WinHttpSetDefaultProxyConfiguration(pProxyInfo: [*c]PROXY_INFO) BOOL;
    pub extern "winhttp" fn WinHttpOpen(pszAgentW: LPCWSTR, dwAccessType: DWORD, pszProxyW: LPCWSTR, pszProxyBypassW: LPCWSTR, dwFlags: DWORD) HINTERNET;
    pub extern "winhttp" fn WinHttpCloseHandle(hInternet: HINTERNET) BOOL;
    pub extern "winhttp" fn WinHttpConnect(hSession: HINTERNET, pswzServerName: LPCWSTR, nServerPort: INTERNET_PORT, dwReserved: DWORD) HINTERNET;
    pub extern "winhttp" fn WinHttpReadData(hRequest: HINTERNET, lpBuffer: LPVOID, dwNumberOfBytesToRead: DWORD, lpdwNumberOfBytesRead: LPDWORD) BOOL;
    pub extern "winhttp" fn WinHttpWriteData(hRequest: HINTERNET, lpBuffer: LPCVOID, dwNumberOfBytesToWrite: DWORD, lpdwNumberOfBytesWritten: LPDWORD) BOOL;
    pub extern "winhttp" fn WinHttpQueryDataAvailable(hRequest: HINTERNET, lpdwNumberOfBytesAvailable: LPDWORD) BOOL;
    pub extern "winhttp" fn WinHttpQueryOption(hInternet: HINTERNET, dwOption: DWORD, lpBuffer: LPVOID, lpdwBufferLength: LPDWORD) BOOL;
    pub extern "winhttp" fn WinHttpSetOption(hInternet: HINTERNET, dwOption: DWORD, lpBuffer: LPVOID, dwBufferLength: DWORD) BOOL;
    pub extern "winhttp" fn WinHttpSetTimeouts(hInternet: HINTERNET, nResolveTimeout: c_int, nConnectTimeout: c_int, nSendTimeout: c_int, nReceiveTimeout: c_int) BOOL;
    pub extern "winhttp" fn WinHttpIsHostInProxyBypassList(pProxyInfo: [*c]const PROXY_INFO, pwszHost: PCWSTR, tScheme: INTERNET_SCHEME, nPort: INTERNET_PORT, pfIsInBypassList: [*c]BOOL) DWORD;
    pub extern "winhttp" fn WinHttpOpenRequest(hConnect: HINTERNET, pwszVerb: LPCWSTR, pwszObjectName: LPCWSTR, pwszVersion: LPCWSTR, pwszReferrer: LPCWSTR, ppwszAcceptTypes: ?[*:null]const LPCWSTR, dwFlags: DWORD) HINTERNET;
    pub extern "winhttp" fn WinHttpAddRequestHeaders(hRequest: HINTERNET, lpszHeaders: LPCWSTR, dwHeadersLength: DWORD, dwModifiers: DWORD) BOOL;
    pub extern "winhttp" fn WinHttpSendRequest(hRequest: HINTERNET, lpszHeaders: LPCWSTR, dwHeadersLength: DWORD, lpOptional: LPVOID, dwOptionalLength: DWORD, dwTotalLength: DWORD, dwContext: DWORD_PTR) BOOL;
    pub extern "winhttp" fn WinHttpSetCredentials(hRequest: HINTERNET, AuthTargets: DWORD, AuthScheme: DWORD, pwszUserName: LPCWSTR, pwszPassword: LPCWSTR, pAuthParams: LPVOID) BOOL;
    pub extern "winhttp" fn WinHttpQueryAuthSchemes(hRequest: HINTERNET, lpdwSupportedSchemes: LPDWORD, lpdwFirstScheme: LPDWORD, pdwAuthTarget: LPDWORD) BOOL;
    pub extern "winhttp" fn WinHttpQueryAuthParams(hRequest: HINTERNET, AuthScheme: DWORD, pAuthParams: [*c]LPVOID) BOOL;
    pub extern "winhttp" fn WinHttpReceiveResponse(hRequest: HINTERNET, lpReserved: LPVOID) BOOL;
    pub extern "winhttp" fn WinHttpQueryHeaders(hRequest: HINTERNET, dwInfoLevel: DWORD, pwszName: LPCWSTR, lpBuffer: LPVOID, lpdwBufferLength: LPDWORD, lpdwIndex: LPDWORD) BOOL;
    pub extern "winhttp" fn WinHttpDetectAutoProxyConfigUrl(dwAutoDetectFlags: DWORD, ppwstrAutoConfigUrl: [*c]LPWSTR) BOOL;
    pub extern "winhttp" fn WinHttpGetProxyForUrl(hSession: HINTERNET, lpcwszUrl: LPCWSTR, pAutoProxyOptions: [*c]AUTOPROXY_OPTIONS, pProxyInfo: [*c]PROXY_INFO) BOOL;
    pub extern "winhttp" fn WinHttpCreateProxyResolver(hSession: HINTERNET, phResolver: [*c]HINTERNET) DWORD;
    pub extern "winhttp" fn WinHttpGetProxyForUrlEx(hResolver: HINTERNET, pcwszUrl: PCWSTR, pAutoProxyOptions: [*c]AUTOPROXY_OPTIONS, pContext: DWORD_PTR) DWORD;
    pub extern "winhttp" fn WinHttpGetProxyForUrlEx2(hResolver: HINTERNET, pcwszUrl: PCWSTR, pAutoProxyOptions: [*c]AUTOPROXY_OPTIONS, cbInterfaceSelectionContext: DWORD, pInterfaceSelectionContext: [*c]BYTE, pContext: DWORD_PTR) DWORD;
    pub extern "winhttp" fn WinHttpGetProxyResult(hResolver: HINTERNET, pProxyResult: [*c]PROXY_RESULT) DWORD;
    pub extern "winhttp" fn WinHttpGetProxyResultEx(hResolver: HINTERNET, pProxyResultEx: [*c]PROXY_RESULT_EX) DWORD;
    pub extern "winhttp" fn WinHttpFreeProxyResult(pProxyResult: [*c]PROXY_RESULT) void;
    pub extern "winhttp" fn WinHttpFreeProxyResultEx(pProxyResultEx: [*c]PROXY_RESULT_EX) void;
    pub extern "winhttp" fn WinHttpResetAutoProxy(hSession: HINTERNET, dwFlags: DWORD) DWORD;
    pub extern "winhttp" fn WinHttpGetIEProxyConfigForCurrentUser(pProxyConfig: [*c]CURRENT_USER_IE_PROXY_CONFIG) BOOL;
    pub extern "winhttp" fn WinHttpWriteProxySettings(hSession: HINTERNET, fForceUpdate: BOOL, pWinHttpProxySettings: [*c]PROXY_SETTINGS) DWORD;
    pub extern "winhttp" fn WinHttpReadProxySettings(hSession: HINTERNET, pcwszConnectionName: PCWSTR, fFallBackToDefaultSettings: BOOL, fSetAutoDiscoverForDefaultSettings: BOOL, pdwSettingsVersion: [*c]DWORD, pfDefaultSettingsAreReturned: [*c]BOOL, pWinHttpProxySettings: [*c]PROXY_SETTINGS) DWORD;
    pub extern "winhttp" fn WinHttpFreeProxySettings(pWinHttpProxySettings: [*c]PROXY_SETTINGS) void;
    pub extern "winhttp" fn WinHttpGetProxySettingsVersion(hSession: HINTERNET, pdwProxySettingsVersion: [*c]DWORD) DWORD;

    pub extern "winhttp" fn WinHttpWebSocketCompleteUpgrade(hRequest: HINTERNET, pContext: DWORD_PTR) HINTERNET;
    pub extern "winhttp" fn WinHttpWebSocketSend(hWebSocket: HINTERNET, eBufferType: WEB_SOCKET_BUFFER_TYPE, pvBuffer: PVOID, dwBufferLength: DWORD) DWORD;
    pub extern "winhttp" fn WinHttpWebSocketReceive(hWebSocket: HINTERNET, pvBuffer: PVOID, dwBufferLength: DWORD, pdwBytesRead: [*c]DWORD, peBufferType: [*c]WEB_SOCKET_BUFFER_TYPE) DWORD;
    pub extern "winhttp" fn WinHttpWebSocketShutdown(hWebSocket: HINTERNET, usStatus: USHORT, pvReason: PVOID, dwReasonLength: DWORD) DWORD;
    pub extern "winhttp" fn WinHttpWebSocketClose(hWebSocket: HINTERNET, usStatus: USHORT, pvReason: PVOID, dwReasonLength: DWORD) DWORD;
    pub extern "winhttp" fn WinHttpWebSocketQueryCloseStatus(hWebSocket: HINTERNET, pusStatus: [*c]USHORT, pvReason: PVOID, dwReasonLength: DWORD, pdwReasonLengthConsumed: [*c]DWORD) DWORD;
};
