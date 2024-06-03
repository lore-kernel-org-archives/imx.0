Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E60C6257D
	for <imx@lists.linux.dev>; Mon,  3 Jun 2024 01:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717377479; cv=none; b=Frjp7gwCRgcH/EvsqLoX7ArF3w/5R3gj1S2QFtxI1ZeeadaX5uTG0Pq4w8yLlAlxcefR00h7QuED1HJT2m5F32VLUkITzq+L6XSubtQx2Rs4KUG4r4ughTcfp/uRae9BGpyEZc10zvJX5nSjhgWeiqrKsMypDI77o3hSkaJkP4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717377479; c=relaxed/simple;
	bh=xipNoDV58wNM7qKFFkCH0Jh3A1FzEvQiZMJIisE96bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mHSdjyn9s4YqJclD8FT1GdpxTR2lxGS7VDzFy0NrghNEkriag4W5rGueTOs10ycanbFciJWULBZmhWZQLfQtABb5+NYOOVNIfhhwFQiWqHX7/6N7xc+TZqwhK61mx0nfTYFKW+q4/pj/UEvM3cDR+IEUJ1n1EX3DHPdFx+YXkDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=NRYdGkuq; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="NRYdGkuq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=xrJiZlAlmYcBGPxqQv9LykizLa+iFRwH8KrHphmB6MI=;
	b=NRYdGkuqjaWPyIRJVMkQNeDmqmpsbU8vazsU5Iy+EG7siwnZTF0TO7MR7uJGh6
	JRrb75xMb7w0sxnwL7rOchYBEPOfwXcyCI1AYa2i5mJT5g58ebXzgrom9xv16coL
	C/JaIberJQserxJULrLJeXQNE3QKPHRYISfhtrSbvPm/M=
Received: from dragon (unknown [114.216.76.201])
	by smtp1 (Coremail) with SMTP id ClUQrADnLyGXGV1mE4swBw--.17923S3;
	Mon, 03 Jun 2024 09:17:12 +0800 (CST)
Date: Mon, 3 Jun 2024 09:17:11 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/10] arm64: dts: imx8qm Add audio\flexcan\i2c\fec1
 nodes for imx8qm-mek board
Message-ID: <Zl0Zl6j0Gwy0Vilg@dragon>
References: <20240425-dts_8qm_audio-v4-0-7fa6ab2fd64e@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240425-dts_8qm_audio-v4-0-7fa6ab2fd64e@nxp.com>
X-CM-TRANSID:ClUQrADnLyGXGV1mE4swBw--.17923S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU7iSdDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiGBjyZV6Nn2D6OgAAs7

On Thu, Apr 25, 2024 at 04:24:36PM -0400, Frank Li wrote:
> Frank Li (10):
>       arm64: dts: imx8-ss-audio: remove memory-region = <&dsp_reserved>;
>       arm64: dts: imx8qm-ss-audio: add audio nodes
>       arm64: dts: imx8qm-mek: add sai and wm8960 support
>       arm64: dts: imx8x: add cm41 subsystem dtsi
>       arm64: dts: imx8qm-mek: add i2c0 and children devices
>       arm64: dts: imx8qm-mek: add cm41_i2c and children devices
>       arm64: dts: imx8qm-mek: add flexcan support
>       arm64: dts: imx8qm-mek: add lsio mu5 and mu6
>       arm64: dts: imx8qm: add ocopt and fec_mac[0,1]
>       arm64: dts: imx8qm-mek: add fec2 support

Applied all, thanks!

