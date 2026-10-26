Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793003385;
	b=BcBUi4BKtOGTgmfJREuRRfL0dYxmwEegar9aMmJFZ7/19jCSTvyqD1mVD+MRXGXiQotz
	 wpFNd5GQyQrFDgY421q8HG0dKiFzA9vUcc7EbatVmB19P7NcOIF/QzwWUlFH4JEdlSctJ
	 4ZtdFAhN6W2Py9eL21eu4sHz6l+SO4+Z4rxA3XJsXxQea68EoQo2RH8gaSwsg5NIwvc1U
	 g2EJNZklOP0GSuoADmCef7w3aoZAvIx6zsA4P+NSJM4KibJfvJOgFC8aaKERMzPD0Rsum
	 6lv7WtcIXRxSWQY2/6y81pql0AivkKhmEJYihXbKuQuhdEWmLaP49T39UVNxtj65oBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793003385;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=diTjf1RR+6hk2NNUcDUFo32N0NHYnwNLtS5/2ivO+gA=;
	b=Y/Ojp0f/BWP6oNaBRcu2RAgnFSe0H9ERYStw/ka2PHKGrBtPUu+UTU4sANiwbXAJ0Cdi
	 RScE+bTQhpm/aXfyE/AvHihtLrcJ1au5SK54Yh0lQL9joU2XyftKoxFsPjdNrO3hN3RAK
	 /a/pnshsO0vagLUJL6jUD/ufuTrnw5AF7OCyGo72xxxm5xf9QYTIRWdWg3zTy6uqjhAl3
	 xEaPpTmKb3MbWnKk9ZLqe9g6aOw/EpOdGNc2xdFDwPBBuIAD9u4WniLgTMfOHp+PMbR8n
	 UgAE4WB2ChWTwpuhDDMoBfTBYEBktzTEj2I2uVqjLEVvTGxGVTVgzG9qzZpny8cGiuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Bdr0a268;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EC260A3834
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 08:29:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39EC260A3834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Bdr0a268
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so16922565e9.1
        for <imx@lists.linux.dev>; Mon, 26 Oct 2026 01:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793003383; x=1793608183; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=diTjf1RR+6hk2NNUcDUFo32N0NHYnwNLtS5/2ivO+gA=;
        b=Bdr0a268yeBdpkDNW1GymIyWI8Wg1ru+L83+jxjLRlpxVBMh0+FNKkkJ+hpl6ZZx4Y
         gSMoqWLPbo6nptt3rdTfEXej0PP8SBuWSVSECFFDhHdEzYbGfR61/Itn2/41F9JDfyrV
         ynfbyZhG3sZBpwtA9ww44P/AlrxOrIVwWYW02dNoqCgUwtRLyG6jXOilXvj7x/72HmVI
         vvk1SXRb0U7qBb3a8+xMt4WuEqTpS0bgc495uir5ps+UA++A/IRmaiYPE3g8h/H6Ya7N
         e0Q7a4SYeaSPvB21p0Mqw/Vnu0GjXWop5lT4Zsn3gPw+IEOG3TUWwSfU9LU2Z1J9DCx1
         5bfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003383; x=1793608183;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=diTjf1RR+6hk2NNUcDUFo32N0NHYnwNLtS5/2ivO+gA=;
        b=mKKeodzttwbUvnAPYEMANaJdND1c2vbwKglPJxuj6DkEvrFynoznR2EBDau1Dc5sYk
         Pu8x7eyko6BE5LBtk67lqHLQqQpiADJK5iuXAzqLoepGSsE4ATShgy5GpzbGZVDUEgJG
         Zq4bpZOipG50rChD6KpK+v6s4ANCmSruqYsSy3bA8LB1affLlzWpkjsFWHw4rE3K5dHF
         hTuBF5rkd4TfAzeLiNBbdy+lExSRzR8q8NLxIF+2qoEHlNw6fwBsdmoPCmqmwCBGnsF5
         vYw/mN++FdRELsMYtGHIyQGVRs006ftRcjxyvbxDEeNm879g0K0VA9+AbmwZcYsxs68z
         eNPA==
X-Forwarded-Encrypted: i=1; AKwUvBzuRotv0TusPkXX9lp/GNZkCMSs3+frvs48UZiGT/E24xxjKOwRZOWhwJmA+Es7xApH6jE=@lists.linux.dev
X-Gm-Message-State: AFq9FYLT7kjGykIid47FudUoj6rQUaXv+oHPA72eR8wcXeF7jsn2tBpD
	RzIWZc/0Jfra3A335gHZ5ZNioqf3CRF1LIyukY+akC1Y0SGi58NpqgWe
X-Gm-Gg: AYBFou2F//arnag11V6KO+KYdllSwkKlT5bfvobTzuso5Oh++ekbcgxAae/9jxmRZ4R
	u2EjIwXEn2HXnTPSZFgwWTGZSOOukyfMwx42L6V2WEPMtEQ5ThVi45VpDMfVIVbsAYvmzlsbx7+
	hYwrVNPwzUQZRT5xNy3VTo5HGRnKPXY9QyA5EuDb5FBPkXOacElyL6wNuumYZx7hq4Urklx1pM7
	RERfkhlNKZLuKX6LPv/HLixrwrUJ5QI+Q658uGKQhzqc9uviEKnxJeedUqS4ac/t+w7rxQqTk5L
	Rh3HM9+bFROgXCWkMAnGGSretzjFhbO20mycRmmttNRSknyT39oMnEqrlk6PbZhhI62GTypt2WB
	aS9F4crEBEQfSe7Nz34Vesr/AZEuJGm3BqlsLnxpUEjNxOhY8RgMHBp0EB9NRy7BoGnCuuXkK3V
	9kHyEUB/8NT3jYuWkS47XKp+JiKJLBH0OyrGh8zleqca/EUMz7CNCJ4N4i6UYMf9mqlWP8t0RbC
	3ai1VrifCT82/9E3DYLeYSTOs6XLf3C2n9B87ccUaIJ9Wumg9I8wKxFnwdPluEGkwI19B0ltRv3
	aWwDD6ZSaB9NBqAi+1T44dmhfRHPw4IGpbMKRX4pCsDlCjz2Xo3iOIGdO7hGuCyUBX8b2d1zBJA
	u+2lO5v0=
X-Received: by 2002:a05:600c:4f4f:b0:4a3:5a42:b29c with SMTP id 5b1f17b1804b1-4a35acbc00bmr116641935e9.26.1793003383367;
        Mon, 26 Oct 2026 01:29:43 -0700 (PDT)
Received: from GLaDOS.station ([187.13.216.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a30e22csm178673445e9.2.2026.10.26.01.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:29:42 -0700 (PDT)
Date: Mon, 26 Oct 2026 09:29:39 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	Stefano Radaelli <stefano.r@variscite.com>,
	linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	pierluigi.p@variscite.com, Nate.D@variscite.com,
	Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [RFC] arm64: dts: freescale: Supporting Variscite SoM and
 carrier revisions
Message-ID: <at8Pc9jDy0dX8Sr9@GLaDOS.station>
References: <20261023115242.11197-1-stefano.r@variscite.com>
 <att6GNZAVv64Rlnv@SMW015318>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <att6GNZAVv64Rlnv@SMW015318>

Hi Frank,

On Fri, Oct 23, 2026 at 10:15:36AM -0500, Frank Li wrote:
> >
> >   imx8mm-var-dart-2.2-sonata-1.4.dtb
> >     DART-MX8M Mini v2.2 on Sonata v1.4
> >
> > These are proposed names, assuming that the same DT correctly describes
> > all the hardware combinations covered by each entry.
> 
> If new boards 2.3 appear, do you plan change to
> imx8mm-var-dart-2.2-sonata-1.4-2.3.dtb?
> 
> Rename affect addtional problem or efforts when back port.

No, our intention is to keep the filename unchanged. For example,
imx8mm-var-dart-2.0-sonata-1.0.dtb would retain that name even if it
also supports later revisions, provided that the same description
remains correct for all previously supported hardware.

Regarding the filename itself, would it be acceptable to include both
the SoM and carrier hardware revisions, as in the example above?
Or is there a preferred upstream naming convention for distinguishing
these combinations? I have not found a clear example to follow where
both revisions are included in the filename.

We would introduce a separate DTS/DTB only when the hardware requires
a different description, sharing the common parts through .dtsi files.
Our preference is to distribute complete DTBs that the bootloader
can load directly.

> How about use boards compatible string? You add new compatible for new
> boards, so user know this dts cover which boards.

Could you give an example of how you would handle the root compatible
property when the same DTB is used unchanged on multiple revisions?

For instance, if SoM v2.0 and v2.1 on the same carrier can share exactly
the same DT, would you retain the existing board compatible, or
introduce revision-specific strings? How would those be represented
in the shared DTS?

Thanks,
Stefano
