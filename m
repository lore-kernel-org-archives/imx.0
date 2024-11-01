Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DF3915531A
	for <imx@lists.linux.dev>; Fri,  1 Nov 2024 08:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730449099; cv=none; b=oadliTrclgLHdY5dBkTaLmq7dGFOFpk1exF7X0hEJgb9hkHKSQaKyHV1vRkOYAt6dhRKr7QHDfWWGFAmgsUTCUgYrVzrJHXvWE2ehpjMZoLH1YSJECnduQAYqHgo9bFmx5d/YFHXzmDx+Q98lsYfn8LlIrqMLTtO+ZMVGwdwub4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730449099; c=relaxed/simple;
	bh=5RcrjjO7qeoHBIrv/8qBQTZB/q9clujvw1CFFoAQEC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E621mPvICkB7Rqf/3tVpz2vzrVuPFf+vKDHDJNGxKx7REB0YA2in/Oi3yF8KIvLrNlS6C5Vava04jEp/CLwSeIBjE99O45P+Qq1EYPd6lxg2xnS0sle1g6VunWLKtHTecCNj5MEP1/UH7MlTB0VPS1CWPZQXcb6WmGuZCxM09QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=F3kdZrwR; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="F3kdZrwR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=W//kf/xYk90pfIs56Ch6ErGwbP2X2r0D6G2dOa75D2A=;
	b=F3kdZrwRbH5+cXqtnibhtwd//eQBKihnrDo6se+FoTwKJNQIs0t3AynIjszhNQ
	Fa3oqazt6r2iuWNm+p9U63uTu80vSchr/rK9arzpD6anjLD4xARQRwU/njzpjl0G
	GDJgQ3JRC0rvJ2GJym6Xc9U9LR3F04sldt9lxRRdE+UKs=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgBXXhO2jiRnB35nAQ--.13924S3;
	Fri, 01 Nov 2024 16:17:59 +0800 (CST)
Date: Fri, 1 Nov 2024 16:17:57 +0800
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
Subject: Re: [PATCH 1/1] arm64: dts: imx8mm-venice-gw73xx: remove compatible
 in overlay file
Message-ID: <ZySOtUd9jExZdFt6@dragon>
References: <20241018182824.740133-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018182824.740133-1-Frank.Li@nxp.com>
X-CM-TRANSID:Ms8vCgBXXhO2jiRnB35nAQ--.13924S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUIXTmUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxyKZWckPo77kgAAsi

On Fri, Oct 18, 2024 at 02:28:23PM -0400, Frank Li wrote:
> Remove compatible string in overlay file to fix below warning:
> 'gw,imx8mm-gw73xx-0x' is not one of ['fsl,ls1043a-rdb', 'fsl,ls1043a-qds']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!

