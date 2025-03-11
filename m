Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62168339A1
	for <imx@lists.linux.dev>; Tue, 11 Mar 2025 02:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741660356; cv=none; b=RRp6PdQN0ESUz05L09TOrqQxKAN6dH6AMj91KFxjGPlHIgLF3ZXB1XNyWoj+fLXRal+sPJjY2LzDKhxAbdMry7OkXTbaXET+5WBKkRHfdos1OfNkUfQLdvPNhjjQH/WsOUQ44awYGK/S5WrGc4ngHs4sbyOtTJvc1iz56LI3XJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741660356; c=relaxed/simple;
	bh=coXBP7+HE8LjreCY8dhmjrPA3iLUA6DYRyBKO9dgb0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rmN2WGwmEo+OfZBmHQ0Bbk00hUx98qCZ3hUquyv9Jz561PNjHgEFYXFUJCr3fwjrpJITufdThJpFeK0hus7mlcrhZMVoX56OAvLjsCPbN25bDGbkqZzCDSJhq6vSXHRjTcwRd8cMzjvAmvBxFGZ1MitsPKtwu5OWctjECCmc4kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=mISa2eJM; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="mISa2eJM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=hOHv8pX5jbxxuCYHGHw737xsClV8Yj1+G5jAUW7Z8nc=;
	b=mISa2eJM9214+1xaX0k7LKZ1UnOPAOPCJL24x69Xjmma+nn14mcBDv8xaIOgIb
	VQkjpd529Q/ddmclfK6A9DXRBVLR0tM+Gus4MTiea9agnHiY/25YtIvGqYig1v5+
	8qD2P/DBVwZisvSTpQBSQCNk+Dmm9B489zH2DcO+lQxKE=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3AoqloM9nvESvAA--.42680S3;
	Tue, 11 Mar 2025 10:32:07 +0800 (CST)
Date: Tue, 11 Mar 2025 10:32:05 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: imx8mp-tqma8mpql-mba8mpxl: change
 sound card model name
Message-ID: <Z8+gpX+REkX4SEUz@dragon>
References: <20250224150016.499055-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224150016.499055-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:M88vCgD3AoqloM9nvESvAA--.42680S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Wr43uF43XrWfWw48Zr1xuFg_yoWxuFg_AF
	4fGr1DGa1DZan3uw1Fkr4agrZa9ws7X3ZrGr13G3sxX3WFkan5Wrs0q34Syw1j9ayvg345
	Cr9aqa1093yjkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0rsqJUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNAcfhGfPoKfalgAA3L

On Mon, Feb 24, 2025 at 04:00:14PM +0100, Alexander Stein wrote:
> From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> 
> The card name for ALSA is generated from the model name string and
> is limited to 16 characters. Use a shorter name to prevent cutting the
> name.
> 
> Since nearly all starter kit mainboards for i.MX based SoM by TQ-Systems
> use the same codec with the same routing on board it is a good idea to
> use the same model name for the sound card. This allows sharing a default
> asound.conf in BSP over all the kits.
> 
> Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied both, thanks!

