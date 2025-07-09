Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4424D22577E
	for <imx@lists.linux.dev>; Wed,  9 Jul 2025 14:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752071513; cv=none; b=P0jcuvgxsqHHEdtUFV1B6uj5F+xDFtT1WQDnjRGN6RTvXHeeDzmX3qqVTiBRZMLi2psRYx73TNmONmfHVzjUU/bDAG6CPJG3/kkP1NcJShF2GxMoluc3pPNIevAlO21HvbS5OmBJbzjuvGndaj8kvx/YdfJz1K7gh9FVQsn0Skk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752071513; c=relaxed/simple;
	bh=7BtyFzEqdQqk9noBz1kWPn+TluwkrsvSZ+NX6r1NPy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AAlatyMJJFm9AXG8q9gREZQy+EiLuui5qvT+QRt0SfymEFjRn2rXXpzSl10usWcE0gGpIWHzYqP+YuJaDNXfLsVVBu7Z9BTjQEVPXCWQopzG/BmPUM9r/6Kw7DsNE9MiwmIIaEXTLl7mXxz9FNGbKRrCAYcCZPHJFH9tpzxP6qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y9cbFYS7; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y9cbFYS7"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-235ea292956so49778585ad.1
        for <imx@lists.linux.dev>; Wed, 09 Jul 2025 07:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752071511; x=1752676311; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8ob8aeY+0rAZIUvRDNkYhpVzGwYIQJmUrDC32TtGUBQ=;
        b=y9cbFYS715vhLPHYAP8Shsa6srs1049MnQ6f6xYZUiuugvxrSv7IZPoM8TSllIEVDQ
         SbN/ZWWPscRGBVsqlyxgP2hAWO5hQAdF3DqxH//Gd4UAY3cTN1roaR1tJoV6HHkIj/tC
         vHX7v6DN5VEmrv5204aBUapHWZRV4H7MAD3wtAMU3ruH6bsAL6eqPntL2fhgj8kbmgQz
         LM3YL8nN+HFHhAzqSb5KrbsFRB9x2QIb3/TT877USAnJL8LU9QFXPFIjm9o3aZ5Lgeo/
         UW28aKqe0v76Is91gzXj53nZN+oZKwSNxXXtIhNy/AYKelWh+qXxthvtGWpruumLvArn
         rrHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071511; x=1752676311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ob8aeY+0rAZIUvRDNkYhpVzGwYIQJmUrDC32TtGUBQ=;
        b=c84YGR06QMye5DP2WEc02GItHWbFbyuroODTtybo3i0EVA6CqRfh0f4fK3qhpIX4OZ
         9aGzE7MAi8FuTBJOyCyvZIGyQfIr/e9jliHPD7VvmMC88DUBpG4KMdch8i7m/oZMnlqr
         2za1AFzAANK8mQoVzjLrrs8rb3cSzkqkY6mUncRhfqFgaeWjFw/PGdY7cB0pHjgiy3Ss
         h3DwevbxCtW4hHZ6hYu/lYbygBn/yFR9sg9mi80KUmFFwKRUfHNi7CVnL0+tZ5gmNokG
         BRNrBpxvGCnEAFImH2n7py+FQll8G3cPa3ROW4hOjXI7G7F7t+rFu8V03D6yyfaKY/wx
         RbVA==
X-Forwarded-Encrypted: i=1; AJvYcCVhThoPoB97AvHIxrc3fFITtmJtVHujcnNyYWMyrSg6tGyrClKnFd/Obm7ZfKHsWjkGFa4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxhsMtUSgJQXq5FbNvFGoM27AfbdJdhiPiRaGmsugIU4Gqzb1Yi
	GxjA1f/ZGy83N9R2gy1t06k0WWbPC30pEu8QGGr+oQ1x+esW30RO6feQ0YMgUR8SNmM=
X-Gm-Gg: ASbGncvSaJPkiq7NkLItjDbmnnD7hUCYyIisd2M2vZ70zQdOlzpHx1ho0efwFWeFPTl
	aTy0RRS75GegmOdB7qNq/vwIUJ6hlXBbLdK5AsA2TMCd0dKrpRRBTpurePFzvBhy0lKAHU1eyQQ
	1MwwYb65A0bw5tMzJiM2DyeIfz6mcQpYr0w9/5g3PP9RGfKxp8pr1MECvWLRxjFYSYP8kbRp38r
	lauKD2cRL5znO6zCBFU18KkTTv9CGcjPowUb3hoYAEDHwG7cztBdxl5OskgFNYkR9TJeeb4yzBQ
	WET7waWP3jHrncx/FDyP3CQh9uVMjf94NPH5Lpq0E7mWm9LdYeD4SxPvPuk9VVu3
X-Google-Smtp-Source: AGHT+IEXpbvwTdHDHQUcQtVRwNjYawEjvuYkoQ5Xje633BngDr3uR9fCxc8nAve+MqnqlBJ1YgrlwQ==
X-Received: by 2002:a17:902:e80d:b0:234:adce:3ece with SMTP id d9443c01a7336-23ddb199277mr35277255ad.11.1752071511405;
        Wed, 09 Jul 2025 07:31:51 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:433:ec07:c2cb:e3e8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c845bcf0fsm136242895ad.249.2025.07.09.07.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:31:50 -0700 (PDT)
Date: Wed, 9 Jul 2025 08:31:48 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 3/5] remoteproc: imx_rproc: Add support for i.MX95
Message-ID: <aG59VPhYY5deFo_h@p14s>
References: <20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com>
 <20250625-imx95-rproc-1-v3-3-699031f5926d@nxp.com>
 <aG1J2_nK-LkLQVRj@p14s>
 <20250709074940.GA14535@nxa18884-linux>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709074940.GA14535@nxa18884-linux>

On Wed, Jul 09, 2025 at 03:49:40PM +0800, Peng Fan wrote:
> Hi Mathieu,
> 
> On Tue, Jul 08, 2025 at 10:39:55AM -0600, Mathieu Poirier wrote:
> >On Wed, Jun 25, 2025 at 10:23:29AM +0800, Peng Fan (OSS) wrote:
> >> From: Peng Fan <peng.fan@nxp.com>
> >> 
> >> Add imx_rproc_cfg_imx95_m7 and address(TCM and DDR) mapping.
> >> Add i.MX95 of_device_id entry.
> >> 
> >> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >> ---
> >>  drivers/remoteproc/imx_rproc.c | 25 +++++++++++++++++++++++++
> >>  1 file changed, 25 insertions(+)
> >> 
> >> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> >> index b1a117ca5e5795554b67eb7092db2a25fc7de13b..c226f78c84ad180c69804116d6cfcab19db6aaa5 100644
> >> --- a/drivers/remoteproc/imx_rproc.c
> >> +++ b/drivers/remoteproc/imx_rproc.c
> >> @@ -73,6 +73,10 @@
> >>  
> >>  #define IMX_SC_IRQ_GROUP_REBOOTED	5
> >>  
> >> +/* Must align with System Manager Firmware */
> >> +#define IMX95_M7_CPUID			1
> >> +#define IMX95_M7_LMID			1
> >
> >Any reason those aren't set in the device tree?
> 
> Krzysztof rejected to introduce the IDs to devicetree.
> 
> From IRC:
> "To me this makes no sense in current explanayton - you have 8 cores, but only
> one can be put there, so what happens with the rest?
> And I don't think we care about something like remote and local ID - it is
> the same. CPUs have single number. So this looks like copy paste downstream
> and thus solve it internally first"
> 
> 
> In System Manager Firmware, CPUID is fixed and will not change.
> LMID is also fixed as of now, we not expect customer to change LMID.
> 
> So with "fsl,imx95-m7", we could know the CPUID and LMID for M7, so 
> it does not make sense to introduce new property saying "fsl,imx95-lmid"
> and "fsl,imx95-cpuid". This should be the main concern that DT maintainers
> reject to add properties for the IDs.
>

Ok
 
> Thanks,
> Peng
> 
> >
> >Thanks,
> >Mathieu
> >
