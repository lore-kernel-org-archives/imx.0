Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EA41EDA08
	for <imx@lists.linux.dev>; Wed, 23 Apr 2025 08:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745398636; cv=none; b=iVzkK+AcCGKkCrymZsQ5nhzkfNrGpUMbWBkH6ge5DNgbnggOxS/1IoRIpyG35iC8fXCP0aFnz+HWBC6CeD77+rkZVT/gI5AkJaswAdLOvfE+qz71osqj/36Bo9bwzWx1gg+EPPNSLSfFriwJLlpwGJJPwuUhoYzWckU8obhGaUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745398636; c=relaxed/simple;
	bh=jAGffbxkS51Ffe25MdVdNd/UFKkSVXZh3QS+14qiZN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=abEYOJlP6PEH+Rh0DUs1LWeHmrEdzO688rW/9e1ZBMp/U4cgO5Zz6LLdEvgxXEfc+8g7a+G20RxadlnBAEWlvlbf/AX20yKKzqUYegHd4jBiLW6Rl1jmUJ3PaKI9O6djECmeSIV9qvGGrx60VUS4kuY7b0bG8HpyYHvUmvIJXAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=RbPwiFs3; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="RbPwiFs3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=CwxHeywLh4KrwQiqrLgmDoeWyxSu3XmmurwXVdnBOqA=;
	b=RbPwiFs3tAdHcmyH8/ppEQR4Pj/h9KdEGPwF4+ifl6x6vOr408RanLq7UZSbc8
	vMe4a3L4Pzj+iBDSpdcZixdaoOuYNWZ34R798NXWKoTD992mbC8FX7Po/VBoz53+
	VM59dahKIwVQSLvnST5WHWuyT+UvJa9UAV1YFyYTKzzzk=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCXFNtMqwho8_nRAw--.33766S3;
	Wed, 23 Apr 2025 16:56:46 +0800 (CST)
Date: Wed, 23 Apr 2025 16:56:44 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: imx8qm-mek: consolidate reserved-memory
Message-ID: <aAirTH/lBetu9avM@dragon>
References: <20250326215214.1706887-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326215214.1706887-1-Frank.Li@nxp.com>
X-CM-TRANSID:Ms8vCgCXFNtMqwho8_nRAw--.33766S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUIco7DUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwQ4ZWgIdsHOEAAAsb

On Wed, Mar 26, 2025 at 05:52:14PM -0400, Frank Li wrote:
> Move dsp_vdev* to under existed reserved-memory node to consolidate all
> reserved-memory together.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!

