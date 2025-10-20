Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3733126C7
	for <imx@lists.linux.dev>; Mon, 20 Oct 2025 12:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760962514; cv=none; b=cd9A2lA7JNHdkE7yTTRQydzaABYkIhrEVhl5lKe63eeec2V65cgUSJSkIdKbYogItiBvVfWqgi3A+3t9AvpqV2C/6iV/jngFtljQREDOvkGBJLN12g9YsecsmxSOqJy1XF0ishoEa7JpVvp1ZfBiBB9mSe7dqZwCrHoFhJzcTjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760962514; c=relaxed/simple;
	bh=A2PSBI9x4CIXLc0aeEqEAZ/iINPPAExtIVufP3XOUAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hoAAEPbyFlg0htyzjB7PiBcQxsYImXnSlRfFwyotWdwupaPniQuaD2ofPyLFc/fmgNGSKDabBT4qyrZP6vXQ6HhezMw3XTJsAZ2qGdp5YAnRDA+JRNqVj8PwAGkr7QuRTScxkD97wxrLZOn6oHyCKMLA5g5qAPbFocCHoDpj/sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=qYeqXXYY; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="qYeqXXYY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=/N8g8/qVoPBEKBIfIm1v+a1Lcy8fJnT8su5q5VehsW4=;
	b=qYeqXXYYQ9oyJygq2euQbXLOD/A0TPfRtmR4ttWfL/y2fZtY7PUiRqjv2a2a3p
	Kifv0uKPajfBm9T+nNHuLlJ56SODiMahQwuta3bRIyfs7eOSKrdPJrtxuE9dbpLx
	L58Bki9UhcSF4x9xYkQSJg2AlC8UPGLGt3eLrPgeQ4pNk=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDn16CoJ_ZozapTAA--.27231S3;
	Mon, 20 Oct 2025 20:14:34 +0800 (CST)
Date: Mon, 20 Oct 2025 20:14:32 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, kernel@pengutronix.de,
	festevam@gmail.com, l.stach@pengutronix.de,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: imx51-zii-rdu1: Fix audmux node names
Message-ID: <aPYnqLvUt9672wYb@dragon>
References: <20250915220655.143861-1-jihed.chaibi.dev@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915220655.143861-1-jihed.chaibi.dev@gmail.com>
X-CM-TRANSID:Mc8vCgDn16CoJ_ZozapTAA--.27231S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUcGNtUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNwrLMWj2J6pTqgAA3t

On Tue, Sep 16, 2025 at 12:06:55AM +0200, Jihed Chaibi wrote:
> Rename the 'ssi2' and 'aud3' nodes to 'mux-ssi2' and 'mux-aud3' in the
> audmux configuration of imx51-zii-rdu1.dts to comply with the naming
> convention in imx-audmux.yaml.
> 
> This fixes the following dt-schema warning:
> 
>   imx51-zii-rdu1.dtb: audmux@83fd0000 (fsl,imx51-audmux): 'aud3', 'ssi2'
>   do not match any of the regexes: '^mux-[0-9a-z]*$', '^pinctrl-[0-9]+$'
> 
> Fixes: ceef0396f367f ("ARM: dts: imx: add ZII RDU1 board")
> Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>

Applied, thanks!

