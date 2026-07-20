Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FBF3ED107
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 14:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784556147; cv=none; b=Twj6xRE9Q5wMgtvNHO63WrB8TdGURdBghHA+kxVwR2S4djynIE93JaGfgkXSFbIVi2VGE5hkb6hlhQ3bJfVM105jOENWSv93CJ/IPhOAEPEOIeyNARqWn3jWzYd5xNzjTnj4OOTUWmVwIqWih5S97C8nhc5eseL1fRLlRBHLYO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784556147; c=relaxed/simple;
	bh=rzSDRNXg2hNBJYYiqAkMSddwIljDCmzWH3Th/zYE0UM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ewyblGYapgbUMx5RQ11POHuJoKDUW7IcfEYLbRRtDCy4CsDdMRw7snW5KzxDkjaF5en508k6tkntHL0tDBf1qjDsDIy5FekCkTw0BSx1VPvVQe13yanoRCfIMvvWNTysoDbuH4tHFHooKnizfGUirxybylpaMG4amaIM/RXr+Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=qE0BkfVE; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="qE0BkfVE"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ceaf8a1265so98769555ad.2
        for <imx@lists.linux.dev>; Mon, 20 Jul 2026 07:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1784556146; x=1785160946; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jjgcDbEk+UwGPrm8p3ddZGJiNEptTi23fs+y3mGJy60=;
        b=qE0BkfVEPxbblye2ZK12spEnLvMogSaPbJcljH7jhqVy/CTGjoA9RGak8FEIO0xLI1
         UI47gdpxpcUk1B8ktcvqyw2uqLJ3QEMWtvHorQuTOykRdKavypxHt+uVCxCw0/wqJe1p
         5QDvwuNZe1aTwr4ONX9ARLtyhRz9/FYJnUcYxig+7eXWHXFATTO7vgaDNCNJsakZ9RYi
         LP5bLLqlDDb3yKaQSxJrsQG+SQMcaSYocLCcZLPZR8hxNaudcPBiFcQVLy1mrKeyuvMM
         w5w4UAUUri1Jfm9v7myw80hG48aDtK9eHJJYpJgUW5nWCngrlQK2kgkWve+Bs6UTrehd
         n2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784556146; x=1785160946;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jjgcDbEk+UwGPrm8p3ddZGJiNEptTi23fs+y3mGJy60=;
        b=DVaySvwN7ul6F8JgUvhlwmmrMJRNcig+/wWQZtRLc9gy9hWZ7YmW8sNYIbWFHfEc49
         qy1QMSFIVbOul4lGRRwn+F8RLQ5GxcioB70b6MMHMuUDkhdxUz0tvlt6+JQAysUsxhc0
         MxptZglzB+JxxEbRRatXtOeKUDrgdOozTiuHkIHbjaKAjXGBw7gvfR5xqW+Y1/RynlYQ
         8tRJwOLhljrmF0NJLm5hzDheDiVm3vrabKYwQYMGyEzxUGCEIR1j9twc1DDWSv932rzG
         buM6E07+1YrcXuQjBuZGaMTBX9ZJd1ypLb25aR67W/tKfdg0oeYVaiVgMXI7zf2/EcDT
         HjTA==
X-Forwarded-Encrypted: i=1; AHgh+RrW4udJjBPML0rR5OZLlu0/nK5/Yfai1S9UgOn+H2VmWRa+34ZD8rW/tLsYQarFBjZdmEQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YztnvBtwjiH9c4LTeomhctw8sfnAquj/bOPQXJKq4bhd8KUEUs2
	jHw4aArNZKqyLrciTIANPAZi5kmbTesZ7JdYWE7SxJGtPr3a7zZvYy1RZjSp4hQmnCk=
X-Gm-Gg: AR+sD10kIltA+AxIm1MhJgN2N4+ENOfzOm2EePogxST1rjFId1t2pNlnxWxLwXLABxL
	+QWlESXtrrqiaURadE/G43LUY+wUXfEo60p5c8FU9P2elynNHztkNzDgeIhHXYwBH1HGneJIeod
	/g6WhND2lIw0+nog/Gklw7r+qboOjCflQPijkhvIuQEtq7+p0+DC3DglVREROr3Z0Mu4rDQ/h/q
	TIUhJ/JGCWjdcc4qI+5NCuzFGDR9glX9ksGN6qhDpj/bgxfu/4hHlvKl+TaNmiI/N1aYwgnApOV
	hFurzAadLTytOKZC+8doS0aae8qfBIUmo/59d2gERuqiQ9cDKhLgiPj73d5hZ8oyXT4Iw9sOh3t
	GGst5k5dEAjnyt44sFG+Tl2/EXLqRMNxve7cEYmRqhflvUbsBxat/UE4PHF9YqANH43F+sA==
X-Received: by 2002:a17:902:f78c:b0:2cb:3f5b:6663 with SMTP id d9443c01a7336-2cf348bee75mr154491725ad.11.1784556145405;
        Mon, 20 Jul 2026 07:02:25 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:43::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf346db113sm56870065ad.39.2026.07.20.07.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:02:22 -0700 (PDT)
Date: Mon, 20 Jul 2026 07:02:21 -0700
From: Joe Damato <joe@dama.to>
To: wei.fang@oss.nxp.com
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, linux@armlinux.org.uk,
	wei.fang@nxp.com, chleroy@kernel.org, maxime.chevallier@bootlin.com,
	imx@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RESEND v4 net-next 01/14] net: enetc: extract common
 helpers for MAC promiscuous mode setting
Message-ID: <al4qbRV8h1a5nZCd@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, wei.fang@oss.nxp.com,
	claudiu.manoil@nxp.com, vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	linux@armlinux.org.uk, wei.fang@nxp.com, chleroy@kernel.org,
	maxime.chevallier@bootlin.com, imx@lists.linux.dev,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20260720014317.1059359-1-wei.fang@oss.nxp.com>
 <20260720014317.1059359-2-wei.fang@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720014317.1059359-2-wei.fang@oss.nxp.com>

On Mon, Jul 20, 2026 at 09:43:03AM +0800, wei.fang@oss.nxp.com wrote:
> From: Wei Fang <wei.fang@nxp.com>
> 
> The PSIPMMR (Port Station Interface Promiscuous MAC Mode Register) in
> ENETC v4 has the same bit layout as the PSIPMR register in ENETC v1: bit
> n controls unicast promiscuous mode for SI n, and bit (n + 16) controls
> multicast promiscuous mode for SI n. The only difference between the two
> hardware generations is the register address offset.
> 
> Since the register functionality is identical, the MAC promiscuous mode
> setting code can be shared between ENETC v1 and v4 drivers.
> 
> Rename ENETC_PSIPMR to ENETC_PSIPMMR in enetc_hw.h to match the actual
> register name used in the reference manual, and extract two new common
> helper functions, enetc_set_si_uc_promisc() and
> enetc_set_si_mc_promisc(), into enetc_pf_common.c. These helpers select
> the correct register offset based on the hardware revision via
> is_enetc_rev1().
> 
> Remove the v4-specific enetc4_pf_set_si_mac_promisc() function from
> enetc4_pf.c and the duplicate PSIPMMR_SI_MAC_UP/MP macro definitions
> from enetc4_hw.h, as they are now superseded by the shared code.
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
>  .../net/ethernet/freescale/enetc/enetc4_hw.h  |  2 -
>  .../net/ethernet/freescale/enetc/enetc4_pf.c  | 21 +--------
>  .../ethernet/freescale/enetc/enetc_ethtool.c  |  2 +-
>  .../net/ethernet/freescale/enetc/enetc_hw.h   |  7 +--
>  .../net/ethernet/freescale/enetc/enetc_pf.c   | 11 ++---
>  .../freescale/enetc/enetc_pf_common.c         | 44 +++++++++++++++++++
>  .../freescale/enetc/enetc_pf_common.h         |  2 +
>  7 files changed, 56 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_hw.h b/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
> index f18437556a0e..6a8f2ed56017 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
> +++ b/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
> @@ -69,8 +69,6 @@
>  
>  /* Port Station interface promiscuous MAC mode register */
>  #define ENETC4_PSIPMMR			0x200
> -#define  PSIPMMR_SI_MAC_UP(a)		BIT(a) /* a = SI index */
> -#define  PSIPMMR_SI_MAC_MP(a)		BIT((a) + 16)

[...]
  
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_hw.h b/drivers/net/ethernet/freescale/enetc/enetc_hw.h
> index bf99b65d7598..66bfda60da9c 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_hw.h
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_hw.h
> @@ -180,9 +180,10 @@ enum enetc_bdr_type {TX, RX};
>  #define ENETC_PMR_PSPEED_1000M	BIT(9)
>  #define ENETC_PMR_PSPEED_2500M	BIT(10)
>  #define ENETC_PSR		0x0004 /* RO */
> -#define ENETC_PSIPMR		0x0018
> -#define ENETC_PSIPMR_SET_UP(n)	BIT(n) /* n = SI index */
> -#define ENETC_PSIPMR_SET_MP(n)	BIT((n) + 16)
> +#define ENETC_PSIPMMR		0x0018
> +#define  PSIPMMR_SI_MAC_UP(n)	BIT(n) /* n = SI index */
> +#define  PSIPMMR_SI_MAC_MP(n)	BIT((n) + 16)

I probably would have fixed the leading spaces when copying/pasting the macro,
but that seems like a nit.

I read the rest of the code a few times and it looks right to me.

Reviewed-by: Joe Damato <joe@dama.to>
