Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E272548A8A3
	for <imx@lists.linux.dev>; Thu, 13 Aug 2026 15:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635821; cv=none; b=osgKsf1pAtb5gbhf+rESs8tYFVzrBgK/VbKpPO7lAmWzFVgXBbFSrai1z1cTo4TpyzdIWuiy30jwSoU57/m5BM3jljmhPhBmPMzC7NPwWoxQ3jImOLS5tNU8yn6jEjJWgpME22yKBcgJTohIkq/02qeDJ1ylzlyxkt+PIhss/i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635821; c=relaxed/simple;
	bh=yfRkCuS35PVDJtQH6LGNo0eJraVDhj9aLz4NwrcJT3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t6Jga929EniRZkayTesx0IM+0OEiTRnJXpqgPc1RYqZoVgAEOo2CIy1+KBnEz0dXbZrORKDl38a1Jx10EiHQfZblptn7m1aI96ZbPZ5RR3K2DXn6u+TxiwiWmwqyFpzMRCh2i6iCsz8IyVrPmrs/X03CnfeKDtDQ9O7Lhl1/rYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kw1wNVVW; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kw1wNVVW"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so3188297a91.1
        for <imx@lists.linux.dev>; Thu, 13 Aug 2026 08:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786635818; x=1787240618; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JjmvO0/8z0Ky0cbqYz65H+qVZdA1pLokllKhuMy7Skk=;
        b=kw1wNVVWqTfiz1geR44xhWHVbD6Z307Dsv29H2feaqVec4cfsrzXzz+0nGyB1lrj0M
         +wH94UOrdgaGw173agLcVIgKV/ab7xQmOERo3kZizuiwBlSdqLweqb4f/DWeK9XgZFkw
         L9YmVHnkrghiOre7JtWv/w2dGTpXrnnUCngaVqUus8HVQfIseHr1+hzaJGhah+xlK0yT
         vt+Oh0EJ2ASGatLOkvq0XIt+VAfvVFUMuovWdfY6W6zoqgsuHZKXPRoHgohft+9qwbXI
         djiRaoWgcl1Yjs9h5rYhLn0wBilrZoI1RfbP6s0XMAut9gAyhoDIr9eZ2tgOzwyDyCGD
         zr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786635818; x=1787240618;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JjmvO0/8z0Ky0cbqYz65H+qVZdA1pLokllKhuMy7Skk=;
        b=Rht+OdPheCM3BMAeVCcJMk9CrtnP/i2MsKvxJC5GYCWK8cb/ZvjjJ+nDydtXUD8Q/s
         u9cBTW6/uyMakN5ezqWQ2k4+zM0yN0oeCHP5nS9GqduT8nDTrmpl2WWvUie4J5soypv7
         kM+kPtdOPVyFpXOxi06mIcp5ldE0whngBh+GPpBr77D2KoqokBjdCLku2WAA2Pf98nWb
         0/qq1VLH5QsCuPO/rGN1WliuYodQQmOM0N98u01fwLU65s09W/M+YFcNPDRW/4jv8yn5
         cx/uWCi2gPjVJgte2SnJuy93cMccuVe/nA1z0/nEVz+EvwGvrzqJu5n7pjHPm9OGtZBJ
         L2qA==
X-Forwarded-Encrypted: i=1; AHgh+RrCgGCQ+8X92HyCOxcGDnuOy6G+6RpVqDaIP3W7Fpq0mRm6roXWxcYl0oE2I2MUSGpne7E=@lists.linux.dev
X-Gm-Message-State: AOJu0YzGtH4RasW2bKRrd4dtvztNRZue81zXLgLcQwHCZyxI6qy3I0vl
	wzTsk/vNAjefjCQiwgGmyBHOmC2Ab3GPEXohijNX88H8CkO8ZwfMrGe6
X-Gm-Gg: AR+sD102OwuleKiH318w80VLx40VB4xnItyc2tosGodHn4DT12b6Ua3oMrvos6XaOXC
	K3AdaHuuns1b4qmarHv5RKNiBCtMxLOZ8xcMdtMZjVvdzU9jTPVlasnXI693dycDEeProfrucRR
	H9uO6sTF9UucmLzFaijrs4BQCnYmPvByqKjc3j5V8ysmomFlleosp/VPL/wmFqfQhqqsRqUM4Z/
	y7waPYCTH7DyqnCRPu22gkgnbxtJbISNxeTQ3QqDnkxVnbjP3eXRa7M3v1ytTnXGJJawkjsen7L
	ZCIjReXeiaQ2NK/hbb//IEXFkFKB6G0QiFqUIJduXn1g29AkWQ7YIn35II59RyySsvdPDhRSDU6
	bHSVjxw6BbWm6FvaCE+I7Vrb6ezL4lJhWY4668W+/1gIsjj2ID3e3Zp3ba0npYbBUWTCe3IKTV+
	D+1mGpYlNALLuXok1zP+R63Sj54iMQwt2NvGSQDZ4tLGDIGBYiHe00DvEtoBM2mjerAzs=
X-Received: by 2002:a17:90b:3843:b0:38e:1497:af5b with SMTP id 98e67ed59e1d1-3931dffc226mr7907538a91.1.1786635817974;
        Thu, 13 Aug 2026 08:43:37 -0700 (PDT)
Received: from leonardoc-nb ([179.160.38.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931dadc0f4sm1600312a91.2.2026.08.13.08.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:43:36 -0700 (PDT)
Date: Thu, 13 Aug 2026 12:43:29 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 6/6] arm64: dts: freescale: imx8mp-verdin: Add Mezzanine
 with Toradex Display 10.1" LVDS V2
Message-ID: <rglymw6p4c65yoqz3pjn6e6nq7cil2fa7m7dqghshgdpavby7d@kyza3ceavq6z>
References: <20260813133335.1941580-1-leoreis.costa@gmail.com>
 <20260813133335.1941580-7-leoreis.costa@gmail.com>
 <an3brO5COdw_F76m@SMW015318>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <an3brO5COdw_F76m@SMW015318>

On Thu, Aug 13, 2026 at 09:58:52AM -0500, Frank Li wrote:
> On Thu, Aug 13, 2026 at 10:33:35AM -0300, Leonardo Costa wrote:
> > From: Leonardo Costa <leonardo.costa@toradex.com>
> >
> > Add a device tree overlay enabling the Toradex Capacitive Touch Display
> > 10.1" LVDS V2 on the Verdin Development Board with Verdin iMX8M Plus
> > Mezzanine expansion board. The panel connects via the i.MX8M Plus LCDIF
> > on the Mezzanine LVDS interface (J10). The panel is an Opto Logic
> > SCX1001511GGC49 10.1" WXGA TFT LCD LVDS and the touch input is provided
> > by an ILITEK ILI251x capacitive touch controller.
> >
> > Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> > Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine
> > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > ---
> 
> what's difference with Add Toradex Capacitive Touch Display 10.1" LVDS V2
> 
> why not share one dtso?
> 
> Frank

Hi Frank,

There are two main differences:

1. The mezzanine one uses different backlight controll pins, so here we
use the 'backlight-mezzanine' node, instead of the 'backlight' one, used
in the one without the mezzanine.

2. The touchscreen GPIO and interrupt pins are also different with the
mezzanine board.

Leonardo
