Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDED527F756
	for <imx@lists.linux.dev>; Sun, 16 Nov 2025 13:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763298800; cv=none; b=Biji/MEUWjmOcN8O22o7k2ENOxcC4oCwcx+th7Gwd4aGYRer64qiSLRsSsJOzW4agMcmNdUwbw7yM9b1dMcpq80qKfUMyjV9gHv4DT4ImmDRdLVHwnEyB2m7sk5wNFqbx/Xrd4Zg1gsRbIhVMIerNF3J7scITtZ7Dr4Y8f8W7MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763298800; c=relaxed/simple;
	bh=QdREia3Z8CgCG458NglnahkgQe4Yj/oQX3u3ds6+KWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MtLPfEC6SDH8XrgSn2EZL1MI0jY0c079DGWfk9LuJrop7p4WG7Ks5ww6CH+DAqU0OiUAMUEMafZ+7k/hvBcOOmwJHQNSEhm5G56XoSBTI1tgkJJY8s5nmYIn2FuJP7S7T1D+ucDozlbyVW9M948mdDlkWciHBZ41/6sKkYtEqEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=mq9OJ5vf; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="mq9OJ5vf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=+jIKbfW5/v+xlkcfxLUv/ia3vHPY9nRhWo0buFo4Dk8=;
	b=mq9OJ5vf7Ev/HLiDkw90zW2aui2AEu6fD2uwPDtcyAq8W1m2tgq5n9Mew1G6O/
	GgBh5hqG1YXpLuKciSK+ws4efl96uefQLGRkk+Fvy9+2zqA74dHgPi0UzF4X48es
	Z3BAUigA54rLGN28uodTyQAArKCU3QIPOimWLxsX6RysI=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAH+7nPzRlpeBc8AQ--.7960S3;
	Sun, 16 Nov 2025 21:12:49 +0800 (CST)
Date: Sun, 16 Nov 2025 21:12:47 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: freescale: tqma9352: Add vcc-supply for
 spi-nor
Message-ID: <aRnNz3S5lp260-Dt@dragon>
References: <20251114083959.1463736-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114083959.1463736-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:Mc8vCgAH+7nPzRlpeBc8AQ--.7960S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUwxhlDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNBFIrWkZzdEqsQAA33

On Fri, Nov 14, 2025 at 09:39:58AM +0100, Alexander Stein wrote:
> (Q)SPI NOR flash is supplied by 1.8V. Add the corresponding supply.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied, thanks!

