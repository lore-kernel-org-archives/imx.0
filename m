Received: from proxy41133.mail.163.com (proxy25213.mail.163.com [103.129.252.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37913800
	for <imx@lists.linux.dev>; Mon,  7 Jul 2025 08:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.129.252.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751875918; cv=none; b=Tcnitq9udx/TyBe06zKKGUfXI+u410rK4gcVO4ohkQnv16xpeEQU8sQataiGkKAkqzzN0jOFeVDbruXsvW2ry1QZlw9tSmwizDYtlwWis0C5k3f9QGWgM2DU5L4GVw3fj90UkFDC51mD38xUj+lHwQkSifzlXyX1A2N1a/2cphc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751875918; c=relaxed/simple;
	bh=Kq5pU6gDzEffrT+9dFMbOU6haoLKeyQPRrR7upar/HY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fFZbXTZl++7MH04LBSUU9shxDOzOFEpDUMcsWLzi14qBHCOH87qu23KpPZvfiTGSfkOqXmQk3vpd/X3AlpSDLUuuhXrI9WSToP2YNdvO5I3S9sE4+eguYejbzi7NZ397CtXariQgynglQT9NV4cBedXICPgrtVr9ESBE2Y+4MoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=LHnDhd9G; arc=none smtp.client-ip=103.129.252.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="LHnDhd9G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=wYX/8ebPYdpS41EyMmngCwqiXAfSXeLhLg4jCU+kiWA=;
	b=LHnDhd9GsZXNX1ANay97WouX3tk3XrUeICgpM53urvzr1D7DXARWl9dysQoJlB
	R0zHDZe6yMOwl7p7eQPlCbFIWcembZzb1GCmVjNIgVHRhVAjBse4l2FhsNG5XyJm
	xkykdDU3lBJ893oXW7Ffiyob9/rjaQjdCS5TpWQLOruXI=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDn_3v2gGtoAmE8AA--.26131S3;
	Mon, 07 Jul 2025 16:10:32 +0800 (CST)
Date: Mon, 7 Jul 2025 16:10:30 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <csokas.bence@prolan.hu>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@karo-electronics.de>
Subject: Re: [PATCH] arm: DT: imx6: Replace license text comment with SPDX
 identifier
Message-ID: <aGuA9gJj2cpCfIZ2@dragon>
References: <20250626-karo-dts-lic-v1-1-315f43121aaa@prolan.hu>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250626-karo-dts-lic-v1-1-315f43121aaa@prolan.hu>
X-CM-TRANSID:M88vCgDn_3v2gGtoAmE8AA--.26131S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7JryfAF1UGF4DWF18Ww4rKrg_yoW3AFX_ua
	y8Xw1UAw4agF48KrWfuF1avasrKFWDZr17XwsYqFy7Aa4qqrZ8XFnYgr90vr1DGa1fJrnr
	uFy5J3y2yw17CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbSksDUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIRhTuGhrgPgalAAA3n

On Thu, Jun 26, 2025 at 11:19:56AM +0200, Bence Csókás wrote:
> Replace verbatim license text with a SPDX-License-Identifier:
> 
> The comment heades mis-attributes this license to be "X11", but the
> license text does not include the last line "Except as contained in this
> notice, the name of the X Consortium shall not be used in advertising or
> otherwise to promote the sale, use or other dealings in this Software
> without prior written authorization from the X Consortium.". Therefore,
> this license is actually equivalent to the SPDX "MIT" license (confirmed
> by text diffing).
> 
> Cc: Lothar Waßmann <LW@KARO-electronics.de>
> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>

Applied with a bit change on subject prefix:

  ARM: dts: imx6-tx: ... 

Shawn

