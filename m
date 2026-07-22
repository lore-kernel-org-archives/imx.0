Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C5533E37A
	for <imx@lists.linux.dev>; Wed, 22 Jul 2026 13:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784726711; cv=none; b=gfH40eluaxrLcX6M0PaQwh5KeXaAxj0pN9050Av6g40NXp6Q0i3kSSAxHjbryW58UeOG12FsSzmQOJcLfWddbuJsLvwcvGxkH2V3aS8mkVLE2ZQBHXye51IV0uevifkpENw7Hmj8N54CQoxF+IEf5dLfwFl/dLBDWlJgJ//sh0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784726711; c=relaxed/simple;
	bh=Pg2VRxd7gCM6h+IJ8Y41+glwBqp8kgUUHbMEbqXsK7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fwT3cj3lW4dlh6s+G9OGQSdHQs/xVNsH1lKin2RYwcWM//KIKm14R002EOHZN3P3sDGQ8gw0+HaIEqgL1cTff5eF2xmt7CTQcY+gOe5M56SICoGGDJLfkEVSsNdhdu55QxUoHfpdLwPVw3D7yvTqiZ7tP3E3xk90NhjRf0Fuvcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=YmERf5Gq; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="YmERf5Gq"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84e04df8c46so1887774b3a.2
        for <imx@lists.linux.dev>; Wed, 22 Jul 2026 06:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1784726709; x=1785331509; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1m9B3TqTXQp52+cm2Y/AlOog6dUAN0pTGZwsxsnFWrM=;
        b=YmERf5GqxYYUsnoG2Qq8aGkwzhpcdA2BA8unliE8P2DaAKH4FlICl6QkvfBU5yQtGC
         yGSKDrZhE2kHFjCWpuObnKXwC8RtCFduT4omhEaYooQgZ7xfslDZ0TNFcv7lIjCM94sR
         vZW0V/c/r4iXfWNjb5MaPMChXvGG4suHQcndb051cfTqKtclduym1AULFmhB/h1ZboA3
         mNVJJOSkZbb0TMrPyz+r0E7WQHxp4UmwHoqiQmauV4s9rm0TCyXFuvFiJVUrgi+l3g4i
         XrWWYILA0KkeTPajsKW6DDAJCw4ItysS8V3udG2f+n/FN/I6zyU1PmOM3rgGQjZGB8y1
         8VNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784726709; x=1785331509;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1m9B3TqTXQp52+cm2Y/AlOog6dUAN0pTGZwsxsnFWrM=;
        b=b7ZIFEX+424d4Y7vrVbkF22pk5Gr8PLtUeElP/mRE/j61Fjhkk8jxH8SWe91EGM0a3
         y0aSvz5Z34wCihGxyAg1R1Fo0sxeup5uydTD4NjhPuoZoJjNO2Qi0hyRwtvvmSftBt/n
         RGvBSgDZ8jSvBPv528ysabH11T86Lzto7fkcAFk3ZGNUowGdtISZDRCzBo75U+w6Lr7H
         ErkByhvd3/w1aHHj4Zra0QqtUpVMgcP9A3iBEp/CvLfIlJqhD6mQoY3uOjGaTamWxTA+
         Hb3bIJH1Ne/EYMjHjISo7CTLAjeAbS6i7A2dnhN4kSXyCNkKZL4M3+0mUmTwPkhEvdSq
         MkVA==
X-Forwarded-Encrypted: i=1; AHgh+RpmXGWem4jsuEFN5eg7uxSj5B4Xt3hUIClQA4ySNryGmtF1PWxFEEN5/5bhy8PZ5WePxbE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCWHPZ7oEXJ70Kg0JneHATaKIqoWffDlgAQ2YHSYeuilLIlpt1
	KsF/0LfyfiyZIckm1Q2g0+ArYSYUzSeCPkoAASCd11/5xRTs3gFe088we3WbcG20zSg=
X-Gm-Gg: AR+sD10Uon8gXQiG76tZJQKAPC7gbVLUpVqqzhp3Vu0AHrLIuXFq3yXqDpbD2wXXO0b
	dBTEYBQ/UZ42Mamn1Fm01JeFc7XbaraEnqK7uqAs1tHwes1NvFZWyYN0g38ASaSZ5YfaiBZ4YeW
	cpACBjAg/TqTlUR8xvNiCgFMmfA9J2JADsHBH/uH8+nsjOMYn8qq1heIq9TUykuodLskFMLuTqC
	k2dqYU6WabFVNxSMpCjDei2TgJ00FqpqOiGNXNN4QBbcO2C9Ae733Hhsph5Z/zweH2dT3YXaykQ
	9NEssC9zxYeWPnyRrK3/cvo/KGqDccbUcRVX/hnvo3W5IrFWjs3WfpAQ5nPb6b6VJ8ffRX4TWrd
	ruki+qsDZXmiNhjd3eb9CYIQGyqT4YJcLBU1pa2B/KxeykY4ZF1sANv/TeKA=
X-Received: by 2002:a05:6a00:13aa:b0:84a:2ec8:fac1 with SMTP id d2e1a72fcca58-84c29545550mr24635234b3a.72.1784726709431;
        Wed, 22 Jul 2026 06:25:09 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4f::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17602046sm1332323b3a.59.2026.07.22.06.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:25:08 -0700 (PDT)
Date: Wed, 22 Jul 2026 06:25:08 -0700
From: Joe Damato <joe@dama.to>
To: wei.fang@oss.nxp.com
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, linux@armlinux.org.uk,
	wei.fang@nxp.com, chleroy@kernel.org, maxime.chevallier@bootlin.com,
	imx@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RESEND v4 net-next 10/14] net: enetc: refactor SI VLAN
 promiscuous mode configuration
Message-ID: <amDEtJmcET788Lls@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, wei.fang@oss.nxp.com,
	claudiu.manoil@nxp.com, vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	linux@armlinux.org.uk, wei.fang@nxp.com, chleroy@kernel.org,
	maxime.chevallier@bootlin.com, imx@lists.linux.dev,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20260720014317.1059359-1-wei.fang@oss.nxp.com>
 <20260720014317.1059359-11-wei.fang@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720014317.1059359-11-wei.fang@oss.nxp.com>

On Mon, Jul 20, 2026 at 09:43:12AM +0800, wei.fang@oss.nxp.com wrote:
> From: Wei Fang <wei.fang@nxp.com>
> 
> Remove the enetc_set_vlan_promisc(), enetc_enable_si_vlan_promisc() and
> enetc_disable_si_vlan_promisc() functions, and introduce a new unified
> function enetc_set_si_vlan_promisc() to enable or disable VLAN
> promiscuous mode for a specific SI. This simplifies the logic and makes
> the interface more straightforward. The vlan_promisc_simap field in
> struct enetc_pf is no longer needed to track the current state.
> 
> As ENETC V4 only changes the address offset of PSIPVMR register compared
> to V1 without any functional difference, enetc_set_si_vlan_promisc() can
> be moved to enetc_pf_common.c in the future with minor adjustments to be
> reused by the ENETC V4 driver
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
>  .../net/ethernet/freescale/enetc/enetc_hw.h   |  5 ++-
>  .../net/ethernet/freescale/enetc/enetc_pf.c   | 36 ++++++++-----------
>  .../net/ethernet/freescale/enetc/enetc_pf.h   |  1 -
>  3 files changed, 16 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_hw.h b/drivers/net/ethernet/freescale/enetc/enetc_hw.h
> index 66bfda60da9c..16da732dc5de 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_hw.h
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_hw.h
> @@ -185,9 +185,8 @@ enum enetc_bdr_type {TX, RX};
>  #define  PSIPMMR_SI_MAC_MP(n)	BIT((n) + 16)
>  
>  #define ENETC_PSIPVMR		0x001c
> -#define ENETC_VLAN_PROMISC_MAP_ALL	0x7
> -#define ENETC_PSIPVMR_SET_VP(simap)	((simap) & 0x7)
> -#define ENETC_PSIPVMR_SET_VUTA(simap)	(((simap) & 0x7) << 16)
> +#define  PSIPVMR_SI_VLAN_P(n)	BIT(n) /* n = SI index */

I suppose it would have been nice to only have a single space after #define
above.

The rest of the code looks right and I think the promisc logic is clearer, so:

Reviewed-by: Joe Damato <joe@dama.to>
