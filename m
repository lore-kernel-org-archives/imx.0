Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0206D313534
	for <imx@lists.linux.dev>; Tue,  5 May 2026 08:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777971560; cv=none; b=PksuqPyBbiO4V01RBAcLVNp59m51ShvovlkGUFmg6L9gCotMKg3F3Pvqok1WdL/EzfferYGGDyQQCaL0dekWqexqbdIIH2SF5SY6NSnracXOyFEU/mOQZs8IOrdZ/umjZUTaj1DhUIehIwZB2h0MPIKPy02n4ZRA8fVPoHaQB3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777971560; c=relaxed/simple;
	bh=CHfzsbBBWkt442uo449ObgtnuSTM8h9Xz+UeThmzFOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IHqxThW5yP/iclnjENdqXuLuTnGyv5S1ShSLbKsSV4aalH8ZEehQDwTxunboiqfT9H97BuvFeC7bk0IDfTE/VtH8DIFNQuLWo4Gbd5QQYXXbNL76JZdUkMyB54RvvY/FYnSBsgtlcNzAGO2XQwbKE/GvtVyhisq1jt1DrVhV63E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gAd/ep8C; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gAd/ep8C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777971558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F0r85uYEBvFZwjw3nY1w+QDsZrIZzp0BkVyYOYWi2dY=;
	b=gAd/ep8CUNH7HQwq8zUjoU7MeyNPlL6R4xPaaiV3HAQq8fi/pAHNW7rhwHYc+jGxovA+uF
	giaTaxTFHFFks0NPoyadeXRkM5t3Z8png268IMxGRzWwHfZDDadJePFDaN8zzdCI9bwSiC
	O53+kdG7zTrA0dGBT9QwLROC9OzBrTo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-LTspacLDPTaOTxWww7ORng-1; Tue, 05 May 2026 04:59:16 -0400
X-MC-Unique: LTspacLDPTaOTxWww7ORng-1
X-Mimecast-MFC-AGG-ID: LTspacLDPTaOTxWww7ORng_1777971556
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-48d035e8593so12934195e9.0
        for <imx@lists.linux.dev>; Tue, 05 May 2026 01:59:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777971555; x=1778576355;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F0r85uYEBvFZwjw3nY1w+QDsZrIZzp0BkVyYOYWi2dY=;
        b=GdFBpuVzqDinrP3QZ3Fcw3MZ5OFzMLe3+WkAcBCxW/q5CtEsjI334mmO+l+7QxSaPb
         ygrr3auciZq0PS3fX/J0AS+vJUqoHuO8pv7QbGMs5cK+hXElv7d45jjTQ571rFy2QnoG
         io+AFKSt/tdGosjzxCbk4bdlSF2xsvbCDhhr5CgDwCPrL9syYeFAJsDr0yVoiDF1SaKB
         4TFmEE1wOMHCwVvuZwOIdLIUQ7u4S2xuNiazPjw+VDxqG8PnLBJNR+klwbfThIkb1a0j
         BXkQbJiYsaFaBoEWj7nHkrxGJIdVvuvDh1YhGqmr/bi7+3nPQQigUQUjUxxfUYzKnm6q
         eOIg==
X-Forwarded-Encrypted: i=1; AFNElJ+CWl6gHBi+Rl+jpgS7lJMLF4Q3JEl5I04uENmwsbqTXu7xizq5t2duKxZwuWjUVyXeoAw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzG3PcGhn0YrWwWZzNAt7dgdSvO1fGEYs9bAyVoQcwdkLhDjfut
	Chk9Vg/y2UCu2FEzpATE7m/MUqYa2CWUqmnP4+YzL+WX/pOaciQjzafQP+YFEnIic9vsgg1dVTY
	xPSjwbhoaR+Tz+k8h/T614FlCcWtT60ocjbmfwpCEe2gHUlbC7YP8nw==
X-Gm-Gg: AeBDieuFoNTy3IbBfe58RgR8uUhrErRebRQvkH7+L/1ihp5v2zgs0iTglp7angeIs3j
	RNt1mfFg0hA4fweMvFcFs955pIsUkrKnVZsyyatAIbzcF4R5ki9ygn+dCxVxLiRSQQPoxJ6+3VM
	dYU9r3VpmomKklLOd/3YX9LYxdDL+g8bZG0ptZE2XtKFM95pJMfk9JbOLdDwWKve7YRRBQxf3B6
	IMrs6QoCJI/S56KyLSG+ZdkfcHr5cN8iM/K+2QjPrdiOGdcHrxlbgNLhE4lgBlp5naO2vrgRtZG
	2yYqsNRaLmezAIScafk8YLXpuEvbwZ3BO3a67XlxnHnN4b09qwjocBlHoixP//Vk6NEc/5K/Vqk
	siwOppqUPJjPmDNOhYiMDCCB75xMbyCfUZ4LNPtycvQzTg+WpEzIrjuT/EYtx4EyY7ek=
X-Received: by 2002:a05:600c:5308:b0:48a:5565:ec3d with SMTP id 5b1f17b1804b1-48d03b401f5mr161071145e9.22.1777971555611;
        Tue, 05 May 2026 01:59:15 -0700 (PDT)
X-Received: by 2002:a05:600c:5308:b0:48a:5565:ec3d with SMTP id 5b1f17b1804b1-48d03b401f5mr161070775e9.22.1777971555194;
        Tue, 05 May 2026 01:59:15 -0700 (PDT)
Received: from [192.168.88.32] ([212.105.155.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48d184ed3b0sm12329145e9.34.2026.05.05.01.59.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 01:59:14 -0700 (PDT)
Message-ID: <6324783e-b5c8-462d-8cf7-f6cc9c01ea89@redhat.com>
Date: Tue, 5 May 2026 10:59:12 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 04/15] net: enetc: add basic operations to the
 FDB table
To: Wei Fang <wei.fang@nxp.com>, claudiu.manoil@nxp.com,
 vladimir.oltean@nxp.com, xiaoning.wang@nxp.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, f.fainelli@gmail.com,
 frank.li@nxp.com, chleroy@kernel.org, horms@kernel.org, linux@armlinux.org.uk
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
References: <20260430024945.3413973-1-wei.fang@nxp.com>
 <20260430024945.3413973-5-wei.fang@nxp.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260430024945.3413973-5-wei.fang@nxp.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ewtn_1jQV_z2AFCGGxEqJApFtKzA0ebJYcfCKeyXHsM_1777971556
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/30/26 4:49 AM, Wei Fang wrote:
> The FDB table is used for MAC learning lookups and MAC forwarding lookups.
> Each table entry includes information such as a FID and MAC address that
> may be unicast or multicast and a forwarding destination field containing
> a port bitmap identifying the associated port(s) with the MAC address.
> FDB table entries can be static or dynamic. Static entries are added from
> software whereby dynamic entries are added either by software or by the
> hardware as MAC addresses are learned in the datapath.
> 
> The FDB table can only be managed by the command BD ring using table
> management protocol version 2.0. Table management command operations Add,
> Delete, Update and Query are supported. And the FDB table supports three
> access methods: Entry ID, Exact Match Key Element and Search. This patch
> adds the following basic supports to the FDB table.
> 
> ntmp_fdbt_update_entry() - update the configuration element data of a
> specified FDB entry
> 
> ntmp_fdbt_delete_entry() - delete a specified FDB entry
> 
> ntmp_fdbt_add_entry() - add an entry into the FDB table
> 
> ntmp_fdbt_search_port_entry() - Search the FDB entry on the specified
> port based on RESUME_ENTRY_ID.
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
>  drivers/net/ethernet/freescale/enetc/ntmp.c   | 203 +++++++++++++++++-
>  .../ethernet/freescale/enetc/ntmp_private.h   |  61 +++++-
>  include/linux/fsl/ntmp.h                      |  44 +++-
>  3 files changed, 305 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/freescale/enetc/ntmp.c b/drivers/net/ethernet/freescale/enetc/ntmp.c
> index c94a928622fd..4ed8d783a9a2 100644
> --- a/drivers/net/ethernet/freescale/enetc/ntmp.c
> +++ b/drivers/net/ethernet/freescale/enetc/ntmp.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>  /*
>   * NETC NTMP (NETC Table Management Protocol) 2.0 Library
> - * Copyright 2025 NXP
> + * Copyright 2025-2026 NXP
>   */
>  
>  #include <linux/dma-mapping.h>
> @@ -21,11 +21,15 @@
>  /* Define NTMP Table ID */
>  #define NTMP_MAFT_ID			1
>  #define NTMP_RSST_ID			3
> +#define NTMP_FDBT_ID			15
>  
>  /* Generic Update Actions for most tables */
>  #define NTMP_GEN_UA_CFGEU		BIT(0)
>  #define NTMP_GEN_UA_STSEU		BIT(1)
>  
> +/* Query Action: 0: Full query, 1: Only query entry ID */
> +#define NTMP_QA_ENTRY_ID		1

Sashiko noted that the above comments looks inconsistent with the update
code, where NTMP_QA_ENTRY_ID apparently uses a full query, and 0 just
the entry ID.

If you have to repost for other reasons, please fix this. Note that you
should reply on the ML to sashiko reviews ruling out invalid comments.

Thanks,

Paolo

