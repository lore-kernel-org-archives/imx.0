Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3047A79FD
	for <imx@lists.linux.dev>; Tue, 13 Aug 2024 02:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723517602; cv=none; b=s4W9ar3CnKsHr798Ybm64HIX1DVGe9nXhS4SsGX3oXnHHfGpGsaPS6kHNlEOsXqAsR0ctlVyQhWzBn+WTlcmHBc2yamQpNRiEqD1uKqG2/1j+XvcUoxwnrjIsucNkLfEBFTCFjBY1Vkjb805sWayAberzbwkdYapFf0tlKE1wZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723517602; c=relaxed/simple;
	bh=zpkHEFl4nm22LoiuuejnIWLVPftUOUGgk7YSO/YixTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZKf6mQll0UlCmJ2iVb98yiCM7O9QkrLWQkONTDwjW7hCWVAEKqQVV8xW8f4G9Fz9eELF7K9MGP5gF+LeqyzHphEV1JWORKIICafYxchFkDxAM9FtW+wJugimAfIUV9VmJvP+Ul0gIkNRCVlUhfN1gXRcj0INnYotAcj4tvWAIh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=QCx29F0s; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="QCx29F0s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=c1gYxZpW54fh+G7bon+YmrbzMVsseD0KKts9l3Dg63Q=;
	b=QCx29F0sHHo7LCGKn6Ye0N3F2CwmpN5p3GQ+djlDzTjCAwYUD4r6CLR98F02Le
	xnrgksktLUpSA2m2HHZVpS6mQBObEysamDN21Ix7Dz0zjPmAh24L6hBXvR46Z/fK
	X67CeTIRfSYodyD1AW+5F786dWw/euyLoSe6LwMFl5SJ0=
Received: from dragon (unknown [117.62.10.86])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgBnjyePyrpme1FSAg--.41505S3;
	Tue, 13 Aug 2024 10:53:05 +0800 (CST)
Date: Tue, 13 Aug 2024 10:53:03 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] arm64: dts: imx95: correct a55 power-domains
Message-ID: <ZrrKj5pjypWHN29f@dragon>
References: <20240729064111.2060746-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729064111.2060746-1-peng.fan@oss.nxp.com>
X-CM-TRANSID:Mc8vCgBnjyePyrpme1FSAg--.41505S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUI038UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxY6ZWa6xN8YQwAAse

On Mon, Jul 29, 2024 at 02:41:11PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The A55 power domains is for SCMI performance usage, so for device power
> on/off. Correct the power-domains entry to use scmi_perf not scmi_devpd.
> 
> Fixes: 5e3cbb8e4256 ("arm64: dts: freescale: add i.MX95 basic dtsi")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Applied, thanks!

