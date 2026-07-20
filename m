Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76B330E82C
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 15:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784561342; cv=none; b=SFiUX6CwS+z/T0xfZu8DHNFPIhKJ3GSX5jGTjV6XkwWqdi/agRemV3hkIwukwnSJ+Y9UVkjwR0Y3jQ3LIzqIXCH3pDSnAmUcy6PdXiW8tnooCGkZhlLGqegAUoYBK0OTteOeujBbc9LAcpBl4DwZoX0mlIhbVpLXR6NVZZU6J7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784561342; c=relaxed/simple;
	bh=U4t0Ha5aQQnsOVS92ULllJOo0551YVcY8yAgy7W+cCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ViFBuBGFiqpuCki4zxW2VHJtQdctv8/ZufouiSihmrws55mGzV5jztZFLyqTioc24TpoQxDPxDJlLvZ8o4/VKr2YAkFCNrBOAvhq6nvTC4yuheeg4AbTrg1IxJa3Kvi/8ky/JYCqJczilGRSqvKvBoFPB2j+78EIqb4sg6EXFZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=N0RAcv+7; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="N0RAcv+7"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ceae1ed204so81131685ad.0
        for <imx@lists.linux.dev>; Mon, 20 Jul 2026 08:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1784561339; x=1785166139; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bgz7Y8qBkufWfij3p6tfrGVbR4yOWWu3669don02deQ=;
        b=N0RAcv+7RtI9VwEdNIjLWyo2T1mhIVk/oPk7E3dT3p71aJNTqnioenhaYwxLrT9bDR
         xJ3WXQj8uAnoQ+RVJ9n7rVEe8sICaCHGK1ENemuBLRokOcR69j7MV5QIg+GowUUJ9fXB
         msg4t1Vyrj+VmWoeUiUY8KjCbgXW7k4l4COJZBbxEZypwsPnSc1snYu3x0T5KJAFShYO
         OZXRS/e+PK84BVXG6hghefOG7SRN7V3SsR5bq035wM2PgEpQz45kbqs0oN9uoWrcCaWZ
         RsTDu0VEfAPHbXDtlzwl0FgxTjcuPzmNxwBSaDeL6/qd4b7xSED58tRzqyWKrVa5F2FG
         nVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784561339; x=1785166139;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bgz7Y8qBkufWfij3p6tfrGVbR4yOWWu3669don02deQ=;
        b=LTl1leFUk2FIqld102s2L9HCIZswlIbucErxsAbclQecrr20OdfPAeSOFUZY9jQXws
         NLbOnHjQfDBPvTlEFaTSvXW0aPfZrMgzGKImjXIHH/h9Ilrn296MPxLBQaJsl/O3Ew+/
         p8m4gP9qR+tukZpPKjRYimltJeAnQjaTeIQ8oE8Ma95wHC06cRh7O65VgswNfaKz4EFD
         aItyG9/NvKeXYEHKGQmMAtVYFXIITaVv342kDm5v++GrT7H7cytFIrEW/euNE6mwE3hR
         +bCc89y7tDIRjT3UDQCYmDKtUm+tTvpUK+NGe40KAR8Gtb79qUrmbeSCtckSIbEnHMsx
         B3Dw==
X-Forwarded-Encrypted: i=1; AHgh+RrKA7Lrrg2dhqgE/viChY64leP2GNNfFeft4fY7iljPBgkFLs+qB5EGNx/HGNrIn4w3kBo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxHaD/iGOiWPmlqHeP7AP9U9FMomwlBMPy7D7HSyFXE7luF9MM2
	hfwsisYP2500Cyh9pS03YZlUwp6X0wc6FC+OEb02DHfopvXYBXYFH5kEbI59yInNMco=
X-Gm-Gg: AR+sD11VE4VGHt+TahiEP8fFGOR7mqSfiUZqH6iqqpY+P/YAQDPlTyUo6/vJrfQ4Lle
	HEbIACdGPsUS4pUarvpYL4cOguNDv7HY8hpYF2efThTvKJ1ok44NkjraV6bJXQic9r7yr/gs7gf
	8FUvuOPC4Q5J2160dIq4UlacwNCcxWRKk3ehY/kkKh4BwKL1KlwmAZDmpDh22onNQqRo7V8XplZ
	tDGAKA9b6jCtIzexdhii7TDiNjny1BHy6lZaPGArB6zjlu7dnnlbckHTigNdKU+R7VSKpXXSYjZ
	OK4c2M1Zy5d+9TTw7HXm+XDFPIemApqOHiJMRUrVtQAIF9NytfDz6/XQjYgya+ui8EdL5pF9q1o
	FP5v302z078qUuRi7jSHqHq2RJ7gw2fEqnxiFo+C8TE77OxZqQxGzzR4LCiA=
X-Received: by 2002:a17:903:1b25:b0:2ca:3b31:ef4f with SMTP id d9443c01a7336-2cf34a0a6b5mr140652465ad.40.1784561339559;
        Mon, 20 Jul 2026 08:28:59 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:51::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf34730e35sm58695305ad.64.2026.07.20.08.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:28:58 -0700 (PDT)
Date: Mon, 20 Jul 2026 08:28:58 -0700
From: Joe Damato <joe@dama.to>
To: wei.fang@oss.nxp.com
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, linux@armlinux.org.uk,
	wei.fang@nxp.com, chleroy@kernel.org, maxime.chevallier@bootlin.com,
	imx@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RESEND v4 net-next 11/14] net: enetc: move
 enetc_set_si_vlan_promisc() to enetc_pf_common.c
Message-ID: <al4+uiiXKgaNBa91@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, wei.fang@oss.nxp.com,
	claudiu.manoil@nxp.com, vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	linux@armlinux.org.uk, wei.fang@nxp.com, chleroy@kernel.org,
	maxime.chevallier@bootlin.com, imx@lists.linux.dev,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20260720014317.1059359-1-wei.fang@oss.nxp.com>
 <20260720014317.1059359-12-wei.fang@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720014317.1059359-12-wei.fang@oss.nxp.com>

On Mon, Jul 20, 2026 at 09:43:13AM +0800, wei.fang@oss.nxp.com wrote:
> From: Wei Fang <wei.fang@nxp.com>
> 
> The PSIPVMR in ENETC v4 has the same bit layout and functionality as the
> PSIPVMR register in ENETC v1: bit n (n <= 15) controls VLAN promiscuous
> mode for SI n. The only difference between the two hardware generations
> is the register address offset.
> 
> Since the register functionality is identical, the VLAN promiscuous mode
> setting code can be shared between ENETC v1 and v4 drivers.
> 
> Move enetc_set_si_vlan_promisc() from enetc_pf.c to enetc_pf_common.c
> and export it so that it can be shared between the two drivers. Add a
> revision check using is_enetc_rev1() to select the correct register
> offset (ENETC_PSIPVMR for v1 and ENETC4_PSIPVMR for v4) while keeping
> the same logic.
> 
> Remove the v4-specific enetc4_pf_set_si_vlan_promisc() from enetc4_pf.c
> and replace its call site with the new common enetc_set_si_vlan_promisc()
> to eliminate code duplication.
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
>  .../net/ethernet/freescale/enetc/enetc4_pf.c  | 17 ++------------
>  .../net/ethernet/freescale/enetc/enetc_pf.c   | 16 --------------
>  .../freescale/enetc/enetc_pf_common.c         | 22 +++++++++++++++++++
>  .../freescale/enetc/enetc_pf_common.h         |  1 +
>  4 files changed, 25 insertions(+), 31 deletions(-)

Reviewed-by: Joe Damato <joe@dama.to>
