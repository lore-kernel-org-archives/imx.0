Received: from mail-177132.yeah.net (mail-177132.yeah.net [123.58.177.132])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D70228DB3
	for <imx@lists.linux.dev>; Thu, 28 Mar 2024 13:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711634104; cv=none; b=OvGqTGEbsR1xCnIgc0uDIr0GNYvEBxzh5gpZeZqF+tYK7CRCTa5UFOAJfWR5NYGHu9/nugfZ92nIzmjDn/sRKZftW8NaCx3w0iLAM31NjR5N+54xV6JNdfaGhAK/3rJciblfIJW11gx/iV261wYTm/qbssRhPtYoyNBsywk2xpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711634104; c=relaxed/simple;
	bh=DfrrIRMhf7F8dxUPrgdMEfjKADIvaXWsP4TCkcLf8oU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GYVxj2YFx+TeyEjMdxmC4uZ1kZANksc0ddPJM5p14zo5V5uGMxy58itMqgqcVoYxNzI5q8SH9PgWDmASIkiVKJYGKdNJUyRQf0ltqieplDrNvvsJQrobA2IMwiDXMNjUmJyJIjvlslkPHjrZ9F8gH5rfjvlqY4MipUGlZA/hnso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=B2GyGhGb; arc=none smtp.client-ip=123.58.177.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="B2GyGhGb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=7HuHZRVaWONhQpUVLGaH8mCBo7oDHLgcq9J6Ysi17V0=;
	b=B2GyGhGbnijYUIE6ovaPBfHzlyeGNvjf5Hhrjr8xzi9lf6SKybB5fCzs2nsSwP
	8yRBh9ydcmcMzpDLlDtl85B3L+9oYj7BH7B362RxH/J9yoXxb/KNunXRYX4qiDyw
	N+hCK6djPwQlH1MPT/ayTcKoR+M5tH4kvAtUz6U8IMvfM=
Received: from dragon (unknown [183.213.196.225])
	by smtp2 (Coremail) with SMTP id C1UQrACX_heAdgVmyl1aAg--.12337S3;
	Thu, 28 Mar 2024 21:54:09 +0800 (CST)
Date: Thu, 28 Mar 2024 21:54:07 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Sebastian Reichel <sre@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH v5 6/6] ARM: dts: imx: Add UNI-T UTi260B thermal camera
 board
Message-ID: <ZgV2fyfV5/SW/v+x@dragon>
References: <20240226212740.2019837-1-sre@kernel.org>
 <20240226212740.2019837-7-sre@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226212740.2019837-7-sre@kernel.org>
X-CM-TRANSID:C1UQrACX_heAdgVmyl1aAg--.12337S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUIzB-DUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiGBCvZV6NnpnNkwACsK

On Mon, Feb 26, 2024 at 10:26:28PM +0100, Sebastian Reichel wrote:
> Add DT for the UNI-T UTi260B handheld thermal camera.
> 
> Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
> Signed-off-by: Sebastian Reichel <sre@kernel.org>

Applied, thanks!

