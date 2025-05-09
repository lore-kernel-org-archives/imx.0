Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDE1230D14
	for <imx@lists.linux.dev>; Fri,  9 May 2025 14:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746802471; cv=none; b=seT3NtTEAxgn4LUj0DZS1J1TebmX2O81KcABTt9mNZjSeJP1fTb2HaUGbGv7Km9wHCjVbHlLcEdfkn5QffAO2TYWeBPCS7sJrxts81HA0nMiPKo5zkvDu2oX4F8y+KfW16s3YPoafyFNQEaS8iEr/dqOrJmsMvYsPcTi6RzyYIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746802471; c=relaxed/simple;
	bh=ftCFmTDm4MpBp+NrzQlh8AVYNKU4PO8esHvpD3a43fE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ouc60araJDcfmmBMGcuYY6+2Q9wrHWyIWn9483qj4C/KEGcr2atTT9Q9Ylt/XuJFAwWIRkkdb4g1LVcvm+mAW5sKatQTphIPjnoEjUIGXl2OECc17q85JvJmkz4rtVxQPQbkooY3FN4CRWyberMUgzLTGqD/CLNoI5CK6vMhWpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=CAQD5QrC; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="CAQD5QrC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=oPlOYtBazf98uWZHxWpdn4kV8cJsQLj4ZpKTkdWd44U=;
	b=CAQD5QrCGozhLcpHXuJIkNPy0br7JHKOGqMxioVLuJXJ+uMSG8o8WB6qdujPvn
	sVt5Qn9NJecoUJJ7DO4kKog3/jnunrHXckX7hbzvSaXuJCu0kk86T4JBarYja0Y4
	PVopQAyz/2dotQLiOa/SkXRlk6wkw2lh+aTp9OiV5Rrxw=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDn3_MIFx5o9kGtAA--.4244S3;
	Fri, 09 May 2025 22:54:01 +0800 (CST)
Date: Fri, 9 May 2025 22:53:59 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: mxs: use padconfig macros
Message-ID: <aB4XB+OcNBCkcW3m@dragon>
References: <20250507141504.1332054-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507141504.1332054-1-dario.binacchi@amarulasolutions.com>
X-CM-TRANSID:Ms8vCgDn3_MIFx5o9kGtAA--.4244S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUwxhlDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwpIZWgd37XrywAAsT

On Wed, May 07, 2025 at 04:14:58PM +0200, Dario Binacchi wrote:
> Convert mx2{3,8} dts files to use the padconfig macros defined in
> mxs-pinfunc.h.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied, thanks!

