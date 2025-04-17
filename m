Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C592DFA2F
	for <imx@lists.linux.dev>; Thu, 17 Apr 2025 03:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744859751; cv=none; b=j2lO6PWme3qZXwHmCt7frk9EyRMTKBflwBMY1agUypPjXRH8pgwn1kw2qbKSmEEdphNHcib0Ny62JUiC2+iEtIy8nqZd+62n08Oi/46XEHKx6Ia5fpRORLEF4TwKMC72Y8RZr33y3Owsw/+3kC2jfSz++FzRTWz8X8ZuFfjJwZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744859751; c=relaxed/simple;
	bh=4w9HDTwZ9uLCAvaXqm3KiOzx+eSugSvKqQjCgQom3iA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f4upllv/4wPOhlVJh9ktQmMavYb0X010Omh0FA0xm+S6A/n1cLaezAIiUTEslR315TXnSuVma/4TF/86H25ZIzL0jzwjgXMHk9uVKV6CBrGYc9cy23fuCPCh6GZeUTFgRi73qGhpt81voNJ7gIdKF9nMYbcfd2eCk9Hy+npA5Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WuGU6NtI; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WuGU6NtI"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2240aad70f2so122675ad.0
        for <imx@lists.linux.dev>; Wed, 16 Apr 2025 20:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744859749; x=1745464549; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwDf9Brc2t+0/4XfvkZmCyLYlPH5HkMMGeNv326S6GA=;
        b=WuGU6NtITh/9vHSn2lHhlkO10bXRH5mxfZs9A2WDWiLH+s0asvhXCnm2lhKjq/rS+A
         VmYLHUNSflLCYOXoSLLJvJIykWpZclvyw1Y4HO0lr5SiFnUBQ5OqVwTwe+eV3sPapFyL
         wS6m/gEh3HNHg3PJ3ZQFgaLjzfemaMwi7DsHawx4VadXzEZg4LzNhu6XO5w87gPnYbZ6
         vNuart10iJfExShc5XeBSXBDji5d/ZViAAmQpk72SrxnxOChwHM2qlWcClmiBKvEAQmE
         lEDOTfinvEljCPAntfNJdi4dg/AbN+yvgiNYIhhOZPVV/7QqhgC6EmWMm8GZpuasv/Mr
         oT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744859749; x=1745464549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pwDf9Brc2t+0/4XfvkZmCyLYlPH5HkMMGeNv326S6GA=;
        b=AcyFWzbjB6xCKVxSEH8TA0hBxbPFmND5sg6tCSFGdQK0eEshjo7b0Wjz8YbHpTsoT/
         U48127xL25dKX1sfRs7HbARlcVVRQVf3Vpjim9irjqVlgEOnr/QlvehCQaUHJw3b+8xW
         TKGrWNRyYOd6cZXGdAnURiz4/xtg7WWOCH2llilYuXf1JEESXe+6ixt7E+8NM5n0OsBX
         8J5eKTT5zxpvMe4fCJK9SQFi96zZ+xLCtjKp6Lgau2fPmNesxHD+86CG10h5FEWa80uD
         DvnZgEme1yKftvOb/Cfk2m0tvCKLxgtx85DM7lOBe5rLtrY+hnGbhbnTIUqMMw1Zi7zR
         FJCw==
X-Forwarded-Encrypted: i=1; AJvYcCXqcMTH9U6tDFZs+rPRTsZ5Eo8Gi1+mZzPICS3jDWcgzwHZxgfckF6k6wHzqNB4N+PpECI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxGs8te0vUqqq4kOmKKBEkpzAgRp9yPQOvjuq25fUbugpx9nMEa
	/b+/Rs3esQrLteKxOQnKuOjQbZak9co2ESJ77MNpU3ZyDUs4wLUk/W17aOMZbo6XxOjeFT0LYMx
	fnkhiX060m51lAqm0uUhNv7as8JfhmK4hVXxs
X-Gm-Gg: ASbGncuVb4ZW9H0MJxtywu6uX+JcGd7GIgR8MVlB4C+yA2K2jRyw3Cna7A1aO5D28nz
	7w08H0VC8hdTeN1uq1cErPZEIMcn74RDHqD6yOtm2r+BtZLB1MW1zjEvvfE1NncR4GdVmKbXOZT
	+M/IWHDzwSovOZpPkdmqFP3upkFArCFkYVGLEs2F8bKR8rnozyuwwZVQ==
X-Google-Smtp-Source: AGHT+IEwFGaskee2qiMRjCgEi2pav7BRYb83l5CZZiBruFMpF+9OeMEI6lSO8gVvQa4DVH3ytjjbpgxQCutaGyZWfp4=
X-Received: by 2002:a17:903:320e:b0:224:38a:bd39 with SMTP id
 d9443c01a7336-22c41288366mr1601875ad.20.1744859748757; Wed, 16 Apr 2025
 20:15:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250416010210.work.904-kees@kernel.org>
In-Reply-To: <20250416010210.work.904-kees@kernel.org>
From: Harshitha Ramamurthy <hramamurthy@google.com>
Date: Wed, 16 Apr 2025 20:15:36 -0700
X-Gm-Features: ATxdqUHBp7mMZPkHiTZ2X2hq_hZZqlTXj1dToIY8GOgALovr8Y7cPQPjfa1wB8g
Message-ID: <CAEAWyHfcviAwhjFPY11na8cKSAeD830DRcgetFvPJ2OCJE1MnQ@mail.gmail.com>
Subject: Re: [PATCH] net: ethtool: Adjust exactly ETH_GSTRING_LEN-long stats
 to use memcpy
To: Kees Cook <kees@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Wei Fang <wei.fang@nxp.com>, 
	Clark Wang <xiaoning.wang@nxp.com>, Jeroen de Borst <jeroendb@google.com>, 
	Ido Schimmel <idosch@nvidia.com>, Petr Machata <petrm@nvidia.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Simon Horman <horms@kernel.org>, Geoff Levand <geoff@infradead.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, 
	Praveen Kaligineedi <pkaligineedi@google.com>, Willem de Bruijn <willemb@google.com>, 
	Joshua Washington <joshwash@google.com>, Furong Xu <0x1207@gmail.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Jisheng Zhang <jszhang@kernel.org>, 
	Petr Tesarik <petr@tesarici.cz>, netdev@vger.kernel.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Richard Cochran <richardcochran@gmail.com>, Jacob Keller <jacob.e.keller@intel.com>, 
	Shannon Nelson <shannon.nelson@amd.com>, Ziwei Xiao <ziweixiao@google.com>, 
	Shailend Chand <shailend@google.com>, Choong Yong Liang <yong.liang.choong@linux.intel.com>, 
	Andrew Halaney <ahalaney@redhat.com>, Kory Maincent <kory.maincent@bootlin.com>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 6:02=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> Many drivers populate the stats buffer using C-String based APIs (e.g.
> ethtool_sprintf() and ethtool_puts()), usually when building up the
> list of stats individually (i.e. with a for() loop). This, however,
> requires that the source strings be populated in such a way as to have
> a terminating NUL byte in the source.
>
> Other drivers populate the stats buffer directly using one big memcpy()
> of an entire array of strings. No NUL termination is needed here, as the
> bytes are being directly passed through. Yet others will build up the
> stats buffer individually, but also use memcpy(). This, too, does not
> need NUL termination of the source strings.
>
> However, there are cases where the strings that populate the
> source stats strings are exactly ETH_GSTRING_LEN long, and GCC
> 15's -Wunterminated-string-initialization option complains that the
> trailing NUL byte has been truncated. This situation is fine only if the
> driver is using the memcpy() approach. If the C-String APIs are used,
> the destination string name will have its final byte truncated by the
> required trailing NUL byte applied by the C-string API.
>
> For drivers that are already using memcpy() but have initializers that
> truncate the NUL terminator, mark their source strings as __nonstring to
> silence the GCC warnings.
>
> For drivers that have initializers that truncate the NUL terminator and
> are using the C-String APIs, switch to memcpy() to avoid destination
> string truncation and mark their source strings as __nonstring to silence
> the GCC warnings. (Also introduce ethtool_cpy() as a helper to make this
> an easy replacement).
>
> Specifically the following warnings were investigated and addressed:
>
> ../drivers/net/ethernet/chelsio/cxgb/cxgb2.c:364:9: warning: initializer-=
string for array of 'char' truncates NUL terminator but destination lacks '=
nonstring' attribute (33 chars into 32 available) [-Wunterminated-string-in=
itialization]
>   364 |         "TxFramesAbortedDueToXSCollisions",
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/net/ethernet/freescale/enetc/enetc_ethtool.c:165:33: warning: =
initializer-string for array of 'char' truncates NUL terminator but destina=
tion lacks 'nonstring' attribute (33 chars into 32 available) [-Wunterminat=
ed-string-initialization]
>   165 |         { ENETC_PM_R1523X(0),   "MAC rx 1523 to max-octet packets=
" },
>       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~
> ../drivers/net/ethernet/freescale/enetc/enetc_ethtool.c:190:33: warning: =
initializer-string for array of 'char' truncates NUL terminator but destina=
tion lacks 'nonstring' attribute (33 chars into 32 available) [-Wunterminat=
ed-string-initialization]
>   190 |         { ENETC_PM_T1523X(0),   "MAC tx 1523 to max-octet packets=
" },
>       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~
> ../drivers/net/ethernet/google/gve/gve_ethtool.c:76:9: warning: initializ=
er-string for array of 'char' truncates NUL terminator but destination lack=
s 'nonstring' attribute (33 chars into 32 available) [-Wunterminated-string=
-initialization]
>    76 |         "adminq_dcfg_device_resources_cnt", "adminq_set_driver_pa=
rameter_cnt",
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c:117:53: warning: =
initializer-string for array of 'char' truncates NUL terminator but destina=
tion lacks 'nonstring' attribute (33 chars into 32 available) [-Wunterminat=
ed-string-initialization]
>   117 |         STMMAC_STAT(ptp_rx_msg_type_pdelay_follow_up),
>       |                                                     ^
> ../drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c:46:12: note: in d=
efinition of macro 'STMMAC_STAT'
>    46 |         { #m, sizeof_field(struct stmmac_extra_stats, m),       \
>       |            ^
> ../drivers/net/ethernet/mellanox/mlxsw/spectrum_ethtool.c:328:24: warning=
: initializer-string for array of 'char' truncates NUL terminator but desti=
nation lacks 'nonstring' attribute (33 chars into 32 available) [-Wuntermin=
ated-string-initialization]
>   328 |                 .str =3D "a_mac_control_frames_transmitted",
>       |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/net/ethernet/mellanox/mlxsw/spectrum_ethtool.c:340:24: warning=
: initializer-string for array of 'char' truncates NUL terminator but desti=
nation lacks 'nonstring' attribute (33 chars into 32 available) [-Wuntermin=
ated-string-initialization]
>   340 |                 .str =3D "a_pause_mac_ctrl_frames_received",
>       |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Signed-off-by: Kees Cook <kees@kernel.org>

Thanks for the patch! For the gve part:

Reviewed-by: Harshitha Ramamurthy <hramamurthy@google.com>

> ---
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Andrew Lunn <andrew+netdev@lunn.ch>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Claudiu Manoil <claudiu.manoil@nxp.com>
> Cc: Vladimir Oltean <vladimir.oltean@nxp.com>
> Cc: Wei Fang <wei.fang@nxp.com>
> Cc: Clark Wang <xiaoning.wang@nxp.com>
> Cc: Jeroen de Borst <jeroendb@google.com>
> Cc: Harshitha Ramamurthy <hramamurthy@google.com>
> Cc: Ido Schimmel <idosch@nvidia.com>
> Cc: Petr Machata <petrm@nvidia.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Simon Horman <horms@kernel.org>
> Cc: Geoff Levand <geoff@infradead.org>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: Alexander Lobakin <aleksander.lobakin@intel.com>
> Cc: Praveen Kaligineedi <pkaligineedi@google.com>
> Cc: Willem de Bruijn <willemb@google.com>
> Cc: Joshua Washington <joshwash@google.com>
> Cc: Furong Xu <0x1207@gmail.com>
> Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
> Cc: Jisheng Zhang <jszhang@kernel.org>
> Cc: Petr Tesarik <petr@tesarici.cz>
> Cc: netdev@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/net/ethernet/chelsio/cxgb/cxgb2.c             |  2 +-
>  drivers/net/ethernet/freescale/enetc/enetc_ethtool.c  |  4 ++--
>  drivers/net/ethernet/google/gve/gve_ethtool.c         |  4 ++--
>  .../net/ethernet/mellanox/mlxsw/spectrum_ethtool.c    |  2 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c  |  2 +-
>  include/linux/ethtool.h                               | 11 +++++++++++
>  6 files changed, 18 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/net/ethernet/chelsio/cxgb/cxgb2.c b/drivers/net/ethe=
rnet/chelsio/cxgb/cxgb2.c
> index 3b7068832f95..4a0e2d2eb60a 100644
> --- a/drivers/net/ethernet/chelsio/cxgb/cxgb2.c
> +++ b/drivers/net/ethernet/chelsio/cxgb/cxgb2.c
> @@ -351,7 +351,7 @@ static void set_msglevel(struct net_device *dev, u32 =
val)
>         adapter->msg_enable =3D val;
>  }
>
> -static const char stats_strings[][ETH_GSTRING_LEN] =3D {
> +static const char stats_strings[][ETH_GSTRING_LEN] __nonstring_array =3D=
 {
>         "TxOctetsOK",
>         "TxOctetsBad",
>         "TxUnicastFramesOK",
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c b/drive=
rs/net/ethernet/freescale/enetc/enetc_ethtool.c
> index ece3ae28ba82..f47c8b6cc511 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
> @@ -141,7 +141,7 @@ static const struct {
>
>  static const struct {
>         int reg;
> -       char name[ETH_GSTRING_LEN];
> +       char name[ETH_GSTRING_LEN] __nonstring;
>  } enetc_port_counters[] =3D {
>         { ENETC_PM_REOCT(0),    "MAC rx ethernet octets" },
>         { ENETC_PM_RALN(0),     "MAC rx alignment errors" },
> @@ -264,7 +264,7 @@ static void enetc_get_strings(struct net_device *ndev=
, u32 stringset, u8 *data)
>                         break;
>
>                 for (i =3D 0; i < ARRAY_SIZE(enetc_port_counters); i++)
> -                       ethtool_puts(&data, enetc_port_counters[i].name);
> +                       ethtool_cpy(&data, enetc_port_counters[i].name);
>
>                 break;
>         }
> diff --git a/drivers/net/ethernet/google/gve/gve_ethtool.c b/drivers/net/=
ethernet/google/gve/gve_ethtool.c
> index eae1a7595a69..3c1da0cf3f61 100644
> --- a/drivers/net/ethernet/google/gve/gve_ethtool.c
> +++ b/drivers/net/ethernet/google/gve/gve_ethtool.c
> @@ -67,7 +67,7 @@ static const char gve_gstrings_tx_stats[][ETH_GSTRING_L=
EN] =3D {
>         "tx_xsk_sent[%u]", "tx_xdp_xmit[%u]", "tx_xdp_xmit_errors[%u]"
>  };
>
> -static const char gve_gstrings_adminq_stats[][ETH_GSTRING_LEN] =3D {
> +static const char gve_gstrings_adminq_stats[][ETH_GSTRING_LEN] __nonstri=
ng_array =3D {
>         "adminq_prod_cnt", "adminq_cmd_fail", "adminq_timeouts",
>         "adminq_describe_device_cnt", "adminq_cfg_device_resources_cnt",
>         "adminq_register_page_list_cnt", "adminq_unregister_page_list_cnt=
",
> @@ -113,7 +113,7 @@ static void gve_get_strings(struct net_device *netdev=
, u32 stringset, u8 *data)
>                                                 i);
>
>                 for (i =3D 0; i < ARRAY_SIZE(gve_gstrings_adminq_stats); =
i++)
> -                       ethtool_puts(&s, gve_gstrings_adminq_stats[i]);
> +                       ethtool_cpy(&s, gve_gstrings_adminq_stats[i]);
>
>                 break;
>
> diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum_ethtool.c b/dri=
vers/net/ethernet/mellanox/mlxsw/spectrum_ethtool.c
> index 3f64cdbabfa3..0a8fb9c842d3 100644
> --- a/drivers/net/ethernet/mellanox/mlxsw/spectrum_ethtool.c
> +++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum_ethtool.c
> @@ -262,7 +262,7 @@ static int mlxsw_sp_port_set_pauseparam(struct net_de=
vice *dev,
>  }
>
>  struct mlxsw_sp_port_hw_stats {
> -       char str[ETH_GSTRING_LEN];
> +       char str[ETH_GSTRING_LEN] __nonstring;
>         u64 (*getter)(const char *payload);
>         bool cells_bytes;
>  };
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drive=
rs/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> index 918a32f8fda8..844f7d516a40 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> @@ -37,7 +37,7 @@
>  #define ETHTOOL_DMA_OFFSET     55
>
>  struct stmmac_stats {
> -       char stat_string[ETH_GSTRING_LEN];
> +       char stat_string[ETH_GSTRING_LEN] __nonstring;
>         int sizeof_stat;
>         int stat_offset;
>  };
> diff --git a/include/linux/ethtool.h b/include/linux/ethtool.h
> index 013d25858642..7edb5f5e7134 100644
> --- a/include/linux/ethtool.h
> +++ b/include/linux/ethtool.h
> @@ -1330,6 +1330,17 @@ extern __printf(2, 3) void ethtool_sprintf(u8 **da=
ta, const char *fmt, ...);
>   */
>  extern void ethtool_puts(u8 **data, const char *str);
>
> +/**
> + * ethtool_cpy - Write possibly-not-NUL-terminated string to ethtool str=
ing data
> + * @data: Pointer to a pointer to the start of string to write into
> + * @str: NUL-byte padded char array of size ETH_GSTRING_LEN to copy from
> + */
> +#define ethtool_cpy(data, str) do {                            \
> +       BUILD_BUG_ON(sizeof(str) !=3D ETH_GSTRING_LEN);           \
> +       memcpy(*(data), str, ETH_GSTRING_LEN);                  \
> +       *(data) +=3D ETH_GSTRING_LEN;                             \
> +} while (0)
> +
>  /* Link mode to forced speed capabilities maps */
>  struct ethtool_forced_speed_map {
>         u32             speed;
> --
> 2.34.1
>
