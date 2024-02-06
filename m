Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585D88004B
	for <imx@lists.linux.dev>; Tue,  6 Feb 2024 06:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707200199; cv=none; b=cy+fj/nU3PrnHIshEUlSWVjmCg0prACCLYQqK+r59XcpzvgOzrxiqFlri33bUszSVTNhLcIo/5+v4q7hFKf+wU+v7Yt3mU5HLnglxp/RIUWFJCq9/WznV4X/LX9cgpIMKhnlHWPu5ACU4Iik6uCHe/1LR8a1a3OTt9dlv3Vp+6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707200199; c=relaxed/simple;
	bh=B3tLwb+Ce8mAkLq890UoJ9rPxK/p2G3d9nBQVdJ+m6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gJLCHcPlNmCVmAYSTjSOrbck+aibl6dC7qhYmIPNQeJJDKskRP0FaBzwThw+vucaRlofsN2cuQFlcLsihLdYKYniMB6nG9wCt+osjF5Kx88P1WV3pMdR6aFGiS/1Ck3Kw67p13lIIvXhB/SjIKUihL+STuN439vZKpCwa5enxvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rw2DgD1r; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rw2DgD1r"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e02fa257eeso183585b3a.0
        for <imx@lists.linux.dev>; Mon, 05 Feb 2024 22:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707200197; x=1707804997; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zUK9QqVsVGjBDisUANUUn0yteaZaAoyKpXGmI2G8lZA=;
        b=Rw2DgD1rjV5zXLKG2lEIYvwI2X52SEwa7X9cXcLXD9SpGynps76H8cYdFEBOZnH54h
         GNjUQ4Dyyod8zTA8RmgB1moY2Vq9dE8lMMkEqS++Op9F7Vm+xYpIKtVra6JlVTYSL8x7
         4FQNQ/LUi9wsIK2I7+6DRXtEv0xyfIE510ZfROd8PJNMzq8DN2KvqwiBq26ky7qeD0Qo
         Bzuo3jbwXD/hE7R6BukxjgtodTJKCRxd56suEKH/zJ4t9m2Ou5XzDXdLrCnaTmH5Zauz
         CxATyuQ3XwalT9SxgnAnFTyghEizRmwFzL+6HRb1CDhOb4rJee0mj9htZ0fz3flxyHBu
         A+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707200197; x=1707804997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUK9QqVsVGjBDisUANUUn0yteaZaAoyKpXGmI2G8lZA=;
        b=NcL9V5TwxgVG9P/PM4x0LfEpCAQqo30yry1PmmJQgKXB/WhYY4miYKCoWKUZpD13hK
         S9xUsyiI9/cOIGMGLdGfQo5xNc0yUIuKYIBLw+I3QqK1b8Dx11n6Bt8TTOWfSV27za8S
         pn3hh77HG3Rt9ebrClGWgqk/lq8kmC8eRxhFfgtQZYQaPVQzzgsGnfYWOYh6dCwDm0v1
         vZVCsVQnFqC3v1Deb4yhwZucDvekf6lDX/AQx3FQdHO6WSXFrVzALNOs0aZ7X91Ylp7T
         cLvfzkxPaB2/I/rkpAn8WBUSbgVnVrb/fly0YCJwNrqbmh5l6QWIuQo0w2R3ghCsFt2l
         moAg==
X-Gm-Message-State: AOJu0YwLFc/ySW1tdNDoN+o0LwDEbJLHSpkcjYfZam2SqHrHbK405GY6
	UKhmrCoZaCe9MOMDqhCG6Cc1UBSIEkgxNp89mi4Lz7DJ7RMcOrJ6
X-Google-Smtp-Source: AGHT+IHnVWUiw6+w1n7GssxxDbLPpR4C9DVDKR6aPhknSImz5koyqXPRbRtw5rrShoprP+NpphRKdA==
X-Received: by 2002:a05:6a00:1a93:b0:6e0:5cb7:168c with SMTP id e19-20020a056a001a9300b006e05cb7168cmr419732pfv.17.1707200197487;
        Mon, 05 Feb 2024 22:16:37 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUmGMaaJ+Hp4uWP5KtYN2l2pRRmqlXSfMGqEuOQEOvPyoIR8hKY8wilBjedRnF2IwOWstLa7J1MaXBl7VStNvswVoiEpQM6hez5OXezRA9Rc1HCCSH5nFDvIZGJwpEuPQGV0X+/eJuf26Zyk3Z9344Hf4gAMK2Q/it72zMGBb1FzsPbJZQtPuyiXGgoQUQwxeB37/rPUtLKecFWcagH2CxNWzbKD7+bsHdGjitgyx3wafBbz19SlYD7MExRwaNMuMr5isMLf2Cgv0nuShLkDX6qtv8Hz2r+TDbT5+CFU3g1Mnr9bboXSBWK7w5UqV2rqg0jHpHbs+Chg3wgXbLS+Lx0WgS8
Received: from dragon (144.34.186.27.16clouds.com. [144.34.186.27])
        by smtp.gmail.com with ESMTPSA id du17-20020a056a002b5100b006e047a34834sm950990pfb.182.2024.02.05.22.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 22:16:36 -0800 (PST)
Date: Tue, 6 Feb 2024 14:16:26 +0800
From: Shawn Guo <shawn.gsc@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"moderated list:ARM/FREESCALE LAYERSCAPE ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/4] arm64: dts: ls1012a: correct the size of dcfg block
Message-ID: <ZcHOuo7iTQBlHC/2@dragon>
References: <20240119201035.3124007-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240119201035.3124007-1-Frank.Li@nxp.com>

On Fri, Jan 19, 2024 at 03:10:32PM -0500, Frank Li wrote:
> From: Li Yang <leoyang.li@nxp.com>
> 
> Correct the size of dcfg block to 4k.
> 
> Signed-off-by: Zhang Ying-22455 <ying.zhang22455@nxp.com>
> Signed-off-by: Li Yang <leoyang.li@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied all, thanks!
