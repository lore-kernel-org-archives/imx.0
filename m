Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A9B38553F
	for <imx@lists.linux.dev>; Wed, 22 Apr 2026 16:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776875116; cv=none; b=OZdi0QRWXxol2GKfbXDXceRtovY4GMCjIHaAspQchjHGImRlY/cSK9AnQX3KweTdjLKRJBkai2p7mve3wX5tKOx1+toMn9w53B6h5rlF6wa+HY3+ww+ZVuwZ3gfyFb1TJtjIeBmd72eC4TkbG9QnjL588+aMrhlibnXJHN1EvvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776875116; c=relaxed/simple;
	bh=aGdnrrjI8lPxcmoVxdZhR1KhhfM/YGirogLtJVSTsZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=u7ugxyokGlecpUpJy3286hi6OQBTcxastGg/qHcnqy9R2pIzT2DjJRPeOs6sRK5yEY7AJQifav5QZSkObFBpYAZJJMTdW2RKlL/jXlVAn4XHFJOPt8Mj/JuxXF+tzM9Kz7VYlDCO7bsyUnjnc2zUW9qDG0iqragFQKPsEMBo8Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Nhgmr/dD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Nhgmr/dD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776875114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qSFlJjwss7taNy6z+vQcHuBtEn5xpw5EWTakbtj//YQ=;
	b=Nhgmr/dDhD/WF3cUr1wKhpZvsVzrfQXmbYTJR07YhB/MziLota+KteNxvYD7jRwVNspSuz
	uoWMsgYqFmUR0OwfvqJhRfZtNHibZ1k6aD0epgAoMPXTIo81ve31440rfkTuFEqe50Jk/f
	9SXJruiiI/ehnsOwdan9ChKyGKKxYc4=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-nt1IEvWmPkurntKlFmUAXw-1; Wed, 22 Apr 2026 12:25:12 -0400
X-MC-Unique: nt1IEvWmPkurntKlFmUAXw-1
X-Mimecast-MFC-AGG-ID: nt1IEvWmPkurntKlFmUAXw_1776875108
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8acaea1ffe7so142526936d6.2
        for <imx@lists.linux.dev>; Wed, 22 Apr 2026 09:25:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776875108; x=1777479908;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qSFlJjwss7taNy6z+vQcHuBtEn5xpw5EWTakbtj//YQ=;
        b=rfIODlvraauBhw4kSyuxst6xfmnBYSIQziFiwWUt3sRQDe7i+j5KfpncpRwedRbnXN
         hbE42vqwAMV97G0stoW2gqxSN/g90gbd4c088YG+3kAp7AlvcZ8mehI8pbnkZgd8Z7Bf
         DEsfWCdMB4PDDd+n3Wza1wWXZJmSMzjWOksdp24TqSzHjqANJSb9w+uVgQ45wREH4BQC
         GAwAeKGIytGxuyx5lPIApBo/R7BVbRS9wDurntPlcAdAk6ntXLgV1CDZaQQ25xtNzy1o
         ft0O8nE24Niml0BC/gKnx6fi2kTNdpeZwmGRaRXupo1JwOgG8Ik63IVqq3EPGKUvxJpX
         y2Fg==
X-Forwarded-Encrypted: i=1; AFNElJ9DpTidqxOk4zIP39TGlaMwW5Y2VongmjOmYEHO4aHn2ddkzisH0D94Uf0iScpRazF6IzA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwTx+XLXF01w07T4uUQgitRHz7UYaxNaiUHZkM3VVdrhQ18bfOw
	x5vphC4JqrvHwUVEkLPQUIQzhb1Yq07eD4P+NezEUWW2yJShdojWjseZzcC9KOI8n1xyf5ZRzYn
	p1NQYdIhoQmc88FTyBLuNVu9eOQtypgR1NnRAfdTHK5NBPRe2vUOmJQ==
X-Gm-Gg: AeBDieuKUvgww8ut/Wk6fBuOowMDmR4xL1CxFhOPlfDtXcMyzQkLHdaeCyd5p24w/8H
	J6qNJ2gwmV+MpsRYKxy/8ZrjVJeA1KR3kKhu6MkFUbrs9iX2IwvpPT/f/GPp7ZloDTySuiy8mHc
	HDjnqHMT0vV0ji25rhmvfzlRdapGIdsTCSs91lOqGMeY+7fw2V2ZSEP3F6B7fbGhxqeIwmYkolv
	g1Rc8QV02kTd+1lNUmKWuVwPoKfotVoXS5QV6t1WRslF44YEpesuhQjTfO2/QVwMuD1aJfeWohY
	gbVaTVmZYnPbyz+MvANGDurDPIMBN+1qg/5KqXHPSD50e89GSTH0ilhhRRs/Qr/jG0tZSkxrvdp
	XPoISkbu8AjIl2XjIHalM/B1oGD1pSEsQa0hl6dkCNA==
X-Received: by 2002:a0c:e007:0:b0:8ac:a893:8b5d with SMTP id 6a1803df08f44-8b027fd1849mr309816216d6.7.1776875108497;
        Wed, 22 Apr 2026 09:25:08 -0700 (PDT)
X-Received: by 2002:a0c:e007:0:b0:8ac:a893:8b5d with SMTP id 6a1803df08f44-8b027fd1849mr309815476d6.7.1776875107978;
        Wed, 22 Apr 2026 09:25:07 -0700 (PDT)
Received: from rh-jkangas-kernel ([2601:1c2:4400:6bf0:7677:bcee:4ef0:e09d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae7d79esm130910876d6.36.2026.04.22.09.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 09:25:07 -0700 (PDT)
Date: Wed, 22 Apr 2026 09:25:03 -0700
From: Jared Kangas <jkangas@redhat.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linaro-s32@linaro.org, netdev@vger.kernel.org
Subject: Re: [PATCH v6 3/3] dts: s32g: Add GPR syscon region
Message-ID: <aej2X2Gp-UI3Vmvo@rh-jkangas-kernel>
References: <cover.1769764941.git.dan.carpenter@linaro.org>
 <0e922537c02d1c47734142090f98eb78e921ed34.1769764941.git.dan.carpenter@linaro.org>
 <aeKn2dvOOO43zdev@jkangas-thinkpadp1gen3.rmtuswa.csb>
 <aeZOcCOgMy2g9wqp@rh-jkangas-kernel>
 <aeZYQp9b5aoV7Ihv@stanley.mountain>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <aeZYQp9b5aoV7Ihv@stanley.mountain>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: scaueNGfbWQXSopqMOsgzeQuC7CWoSmZ4yrPYunoPLk_1776875108
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 20, 2026 at 07:45:54PM +0300, Dan Carpenter wrote:
> On Mon, Apr 20, 2026 at 09:04:00AM -0700, Jared Kangas wrote:
> > Fixing Dan's address based on mailmap update, sorry for the noise.
> > 
> > On Fri, Apr 17, 2026 at 02:36:25PM -0700, Jared Kangas wrote:
> > > Hi Dan,
> > > 
> > > [snip]
> > > 
> > > I gave this a test on an S32G-VNP-RDB3 and didn't see any issues on the
> > > dwmac-s32 side, but this appears to trigger a panic when reading the new
> > > debugfs regmap/*/registers file for the syscon node:
> > > 
> > > [snip]
> 
> Oh, ugh...  I didn't realize that this wasn't merged.  I don't have a
> way to test this any more.  The simplest fix would be to do change the
> 0x3000 to 0x100.  The GPR63 register is at 0xFC.
> 
> 		reg = <0x4007c000 0x100>;
> 
> That's probably the best fix as well.  The later register areas would
> be their own syscons.

Tried that out and it looks good to me. With the write routed through
syscon:

    # xxd -g4 /proc/device-tree/soc@0/syscon@4007c000/reg
    00000000: 4007c000 00000100                    @.......
    # cat /sys/kernel/debug/regmap/dummy-syscon@0x000000004007c000/registers
    00: 00000000
    04: 00000002
    08: 000000e7
    0c: 00000001
    10: ffffffff
    14: 1fffffff
    18: 00007fff
    1c: 00000000
    20: 00000000
    ...
    f4: 00000000
    f8: 00000000
    fc: 00000000

No more crashes and 04's value lines up with the S32_PHY_INTF_SEL_RGMII
(0x2) write, so if you're able to post a revision, feel free to add my
T-b:

Tested-by: Jared Kangas <jkangas@redhat.com>

