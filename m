Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794433046;
	b=wMjQjXbZJibzKE/l1/3Cw9qWT+damZ17qCw8f7owrtyjkhoTH9ptr+00ImN66c0Yi5Lh
	 ZfZetNg2aqnDaIn2fZCcpHLqRs49wExQujyul0IqLMGae6Qz7yn/7NeoIugxlUWthjCS7
	 9YRa/YlLtayZyffIVb+0D+ASWZGF2Oo+f6NY6rOpu4B8Un5Pshr5YNzzfd7BeNgCk5LK2
	 DT53phdiXvWJplA6Fh7msW6I5NTZqfiinGTRULbibOqUO2TSNetBkHKAxRfqKo7xhw2R4
	 9dDstaGWh7dhlBHSVCO2ZgX0HQhdkZrx3MI1mus3y3SzDc/L3waP412cLOrOqrhgGAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794433046;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=7oHmp7wHslwL/naMa1YIolsN1f7bMAdVcQ9QQq2tu8Y=;
	b=kjUG5Oq8k7GLqI6FDg4Vi7vAowRaXqlry8vZKB1WW86Qz6iH/tzJxuShcp2heUN09ifV
	 AVYPleppwn7PExI3/aJJgOo3UyuAnJ55QEkSfcH/HOq3mfQv4NCnWYJLZeJGzCMLkcuKS
	 WA8a1kLv+eKI8+w8ifFEm6XZngCgwe08Sa4QRPdrerc2XRbcsxRxstFd1Fl1EoL72q8p8
	 bET5mJuwiryOefPZi7b1XnsXYQWrVlkjEhmTYOLD7zGiIQnbBMnGvasUYgkD1Vv4MTu+J
	 ftFw/qclTwmEAWxQ/vuLmm+54Sny9+xzU+da5fZH2hwE21eOn/y8tITUo41TFKcDM/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=evzobpqr;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD5F606A321
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 21:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BD5F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=evzobpqr
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E150A219;
	Wed, 11 Nov 2026 22:34:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794432900;
	bh=ECyT+XZ12JddSk+s0WafV7Q4vG3zTupna+gcthaRXoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=evzobpqrkmVb6jQGTOIvkbDkW4p2HGL3zLkW7vKT0d/o4bkHP/yBnAi8jWy+Qa964
	 aHN+1D34PJB+zHi3ADbCLfV5tHx79t64T1YL8VmkOFo61eSI9fxwI4Bp3RhOZttX8h
	 eBM82mL8zspd4g2wmYZXahR6U/P6ezlboscIW024=
Date: Wed, 11 Nov 2026 23:37:21 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank.Li@oss.nxp.com
Cc: Martin Kepplinger-Novakovic <martink@posteo.de>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Purism Kernel Team <kernel@puri.sm>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, guoniu.zhou@oss.nxp.com,
	Frank Li <Frank.Li@nxp.com>, imx@lists.linux.dev,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Alice Yuan <alice.yuan@nxp.com>
Subject: Re: [PATCH] media: imx-mipi-csis: add support for
 MEDIA_BUS_FMT_YUYV8_1X16
Message-ID: <20261111213721.GA449775@killaraus.ideasonboard.com>
References: <20261009-csis_sam-v1-1-81f2b0fb76ef@oss.nxp.com>
 <179443170878.3989516.10436477074407728108.b4-ty@b4>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179443170878.3989516.10436477074407728108.b4-ty@b4>

Hi Frank,

On Wed, Nov 11, 2026 at 04:15:09PM -0500, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> On Fri, 09 Oct 2026 18:58:41 +0800, guoniu.zhou@oss.nxp.com wrote:
> > Add MEDIA_BUS_FMT_YUYV8_1X16 to the list of supported bus formats.
> > 
> > The format uses the same CSI-2 YUV422 8-bit data type and 16-bit
> > parallel bus width as MEDIA_BUS_FMT_UYVY8_1X16, but with a different
> > component ordering. Supporting YUYV allows sensors and bridge devices
> > that output YUYV formatted YUV422 data to be used with the i.MX MIPI
> > CSIS driver without requiring format conversion.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/1] media: imx-mipi-csis: add support for MEDIA_BUS_FMT_YUYV8_1X16
>       commit: 3fccdc8f246af658716b8b64393253b28838f355

I have applied this to my tree already. Please don't handle
imx-mipi-csis yourself.

-- 
Regards,

Laurent Pinchart
