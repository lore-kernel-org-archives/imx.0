Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79753425872
	for <imx@lists.linux.dev>; Fri,  4 Sep 2026 19:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788549129; cv=none; b=k/W0C/mKKaT9AZDc1Q1hx+TFOczAkkhw4V3wXSc6zQWYcsHkzQO/R0gr2B4EONh/40uQJdQfFE8IXyF2R8aSOB8z1LXvmBcGCY8o3NWiLe/nbusynFwtQ0h2MPRezfOrI+uQ6mqTNLrMVR9cNAoq/kjX9Z/RnI32/CosfIiiiCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788549129; c=relaxed/simple;
	bh=ZOaRv+ozQi0YBXWLi8zsbpCBh2H8RMSfbYtlbKbXi4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fUXkMe7DiIyJXBoYEjqnLz9hF/qkRUKnzxz9mh4na1hYOZMll1/hHhGe3GzJigIgYPevEg2VGP3uhVvSe06v1TbiKTg0yk6ij1e/ku457RzLMjYd91CQKhPrgNV4snL3GEL+/me0ncCJLOgrwjEfp4Q0v48Gww8GjhF7X/uO90U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XG87J3Cm; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XG87J3Cm"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-85590c5aeabso995827b3a.3
        for <imx@lists.linux.dev>; Fri, 04 Sep 2026 12:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788549126; x=1789153926; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4HJBZzHdO6P6nJOdbBqlWJWT1PzSbfwvCowjEuATTwM=;
        b=XG87J3CmmG4CcvkiuSF7tPNBa09zl+TDV3/xUMifPImFuC4FNvGvKIutbBWFUubR8u
         SOZvFE3lCiBryRIdcNyr55loDu2lB4xl7gZ9tQQIpnzXsl909iRivET2jYsNBJVPgs0f
         ikuvAu0PqtVpYCakQ26reXiWQvtQkmfS37zh1yIRU3HKM3uYe3J3JOf232mcWoNu9B3L
         hCX0KZbr6jny8LIokqHtTUY7/MI0xs85sQUECAQZckjUbWS2djUvzosc28CLOsV069uY
         8iDn0PCDJupqgh4lzxzroSEqvcvoFa4HknyB2qQiKuy1aSrEHLueVuSLGtd/KGz8xWkB
         tdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788549126; x=1789153926;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4HJBZzHdO6P6nJOdbBqlWJWT1PzSbfwvCowjEuATTwM=;
        b=HPYrgWjUPjir7x8qPD79rNgxAH27CCLgGUElFqevalA5DO/LkETi4+jjuBWRPGQf7O
         8bet6mMg4dkMBSMlstxgpSnxLdBEjnSV1BgpD5pUuhXncWBeOY2sFloV5knL9YOqBWdK
         rvYMjY7O7e9jAeUmxBqqK24E6qXasTYklYRsuUHiEPkiODWrIxXBXzvHyi62jpUmccrM
         lbY3Zzc/H2VKo47p7RpnK9E8ZE5T1vxJMv57oy4BFbsEDEHzzJmOEmvmf60dz4dRlc0p
         8ehxkFbG0EDhNAmKYy+4u8eLKgxra8qfHQabOYwk2E01AEySiuuwhooH0R0h+gyztb8R
         F1rw==
X-Forwarded-Encrypted: i=1; AKwUvBwjFQAUm1UXbIkoxjxbWV1vGV8JZp2hbyaJghVk8dmut1pHIEXmtp/rFt7AeXwX1k1M2uo=@lists.linux.dev
X-Gm-Message-State: AFuF++nZfmPQMaEHhsowIIjWRvvg7H5+Tt5i2qMvx+Qv6bhEuQ40msti
	k0HsSV6bV4nPbcazuYN8MC52rVhvOFeBk1j4nnKXVRZswRCeh1gjkyp+qIWUVOXrWNk=
X-Gm-Gg: AYBFou0Af1mB3XDrZsdR+5g8d9toEdEkfNd5oIu4t4xMsXrjj7cDdFTRUegARYV8Xyu
	yE/Uil6tITDzN7p9BfO8WzESXAd3+kmWPPFwayjFBjyZPptlkROWRKUpnh+Il49Rwjkttl2U2p9
	hUmyKc1p1flTTWFbVTmcz2AlWAjKii6yTekejQ1fsyJd4NNL8SiiiQpNg0OeWkOXWf1j0TDgQC9
	zTr+5uc4ZRvtN5WdB9xIsOZiiPcORXzEtcTChAq83z0iIre4/ZCA1VsqLAaeUJtKRVDiV1alVDa
	ToIvXZFD6TDaBjLFn+LY8hAlypFMd+pvZHYELHUzNQhz9IVge1VbIpAI2D15FhvpX6lm3/pcpmS
	8KXBhyiYur9SPa30+ZEqC9MjuYDGTgDJZjUQBe9cYc9/zlYquDQDr1veQGC+vM9TdDCATy1W3G5
	ExsKeqBiXuJo/8KIwbcd55ihDVgnfufw3Qkur3CGbexSL3uEF9s/v+QpcSqYSbkpam
X-Received: by 2002:a05:6a21:1392:b0:3d7:dfbf:7435 with SMTP id adf61e73a8af0-3da3a13d20dmr12237083637.25.1788549125532;
        Fri, 04 Sep 2026 12:12:05 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:f95f:75de:b3f0:3bf5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc45542bd2asm1217812a12.12.2026.09.04.12.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 12:12:04 -0700 (PDT)
Date: Fri, 4 Sep 2026 13:12:02 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Marcel Hofmann <marcel@hofmania.de>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Marcel Hofmann <marcel.hofmann@ingenics-digital.com>
Subject: Re: [PATCH v2] remoteproc: imx_rproc: allow mappings ending at
 region boundary
Message-ID: <apsYAsY31HEIezay@p14s>
References: <20260827123136.438798-1-marcel@hofmania.de>
 <ZR6PR04MB375776E2B1C61FAF1A7FA9719688B52@ZR6PR04MB375776.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZR6PR04MB375776E2B1C61FAF1A7FA9719688B52@ZR6PR04MB375776.eurprd04.prod.outlook.com>

On Fri, Sep 04, 2026 at 03:32:08AM +0000, Peng Fan (OSS) wrote:
> > Subject: [PATCH v2] remoteproc: imx_rproc: allow mappings ending at
> > region boundary
> >
> > From: Marcel Hofmann <marcel.hofmann@ingenics-digital.com>
> >
> > The address range checks in imx_rproc_da_to_sys() and
> > imx_rproc_da_to_va() use a strict comparison for the exclusive end
> > address of the requested range.
> >
> > As a result, a valid request that ends exactly at the end of an address
> > translation or mapped memory region is rejected. For a region [start,
> > start + size), a request [addr, addr + len) is contained when:
> >
> >     addr >= start && addr + len <= start + size
> >
> > This occurs when a loadable ELF segment fills an entire mapped
> > memory region. This can be produced by a linker script that extends
> > the resource table section to the end of its designated region:
> >
> >     .resource_table :
> >     {
> >       . = ALIGN(8);
> >       KEEP(*(.resource_table)) /* Resource table */
> >       . = ALIGN(8);
> >       . = ORIGIN(m_rsc_tbl) + LENGTH(m_rsc_tbl);
> >     } > m_rsc_tbl =0x00
> >
> > This produces a ELF program header like:
> >
> >     LOAD  0x010000 0xa4220000 0xa4220000 0x01000 0x01000 R
> > 0x1000
> >
> > In this case, the segment size matches the mapped region size exactly,
> > causing the address translation to fail with:
> >
> >     bad phdr da 0xa4220000 mem 0x1000
> >
> > Rework the upper-bound checks to allow ranges ending exactly at the
> > region boundary while guarding against integer overflow.
> >
> > Fixes: a0ff4aa6f010 ("remoteproc: imx_rproc: add a NXP/Freescale
> > imx_rproc driver")
> > Signed-off-by: Marcel Hofmann <marcel.hofmann@ingenics-
> > digital.com>
> 
> Tested-by: Peng Fan <peng.fan@nxp.com>  #i.MX95-19x19-EVK
>

Applied.
 
> Thanks,
> Peng.
> 
