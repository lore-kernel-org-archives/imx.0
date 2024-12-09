Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52CDF481B3
	for <imx@lists.linux.dev>; Mon,  9 Dec 2024 08:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733731371; cv=none; b=cxFQLuwxZ1mFSqIcKjJXmtVpObnwyxfCvAOYTkDmTXfivi5UCcJXiMq+Plcj43Q8Ci7m1KnZt6p+x6eTY0aEpz76G0AiGCBS7H5RO6xmdt7XP2Vv2GLaKKvRaFiLHIQk9JC2vwZWay30JXshzDWaN5BxDlIl1h3yrDVHNnSb/5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733731371; c=relaxed/simple;
	bh=JlVF6x0+d/bzmlLoYVXR8KZAC5ObMonJdxOXrS/bSkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RVdGgiS5YELiczddGzBfoYXutUq+4X3SQ6Gkq6Z7H68mefQy8V+311Rf1YOfaFyXkZl0EumMp8XlyW62VXanIPN5FM4hvsju048OkTXWQOtFOh73aaYsCuNJgJBZlEU7L14DYkG0hqTIlSfYxshrVQDi6FQ7Z0P85R7QvYmpHLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=N97k7Cry; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="N97k7Cry"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=/kuYzy4TvOvrW5Ysb7raR4QcHn1lxSFVuvD5F5LoL8s=;
	b=N97k7CryICfX9jh86hJTeBgEADIbl2Lo29RYU94PkaJvrZv89euFfIkA+t8m7E
	4sFUhL9EKlkhDetYq+lXjqDHhehecPNcCMscua1nbfV9cUrYp0s75prWk5006qpI
	EuKiOPQXYyTPxhfdREhNVONR9ejRz9VYvu3+9sJopUgX4=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCHe+ZOnFZnMep5BA--.46497S3;
	Mon, 09 Dec 2024 15:29:20 +0800 (CST)
Date: Mon, 9 Dec 2024 15:29:18 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Adrien Grassein <adrien.grassein@gmail.com>,
	Adam Ford <aford173@gmail.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-mips@vger.kernel.org,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH treewide 04/11] arm64: dts: freescale: imx: Switch to
 simple-audio-card,hp-det-gpios
Message-ID: <Z1acTq/JV/JTHllY@dragon>
References: <cover.1727438777.git.geert+renesas@glider.be>
 <b38545c29d6cbf0b394ddb4747ce810c679f95d1.1727438777.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b38545c29d6cbf0b394ddb4747ce810c679f95d1.1727438777.git.geert+renesas@glider.be>
X-CM-TRANSID:Mc8vCgCHe+ZOnFZnMep5BA--.46497S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUodgAUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiERiwZWdWZpHlSgAAs1

On Fri, Sep 27, 2024 at 02:42:19PM +0200, Geert Uytterhoeven wrote:
> Replace the deprecated "simple-audio-card,hp-det-gpio" property by
> "simple-audio-card,hp-det-gpios" in Simple Audio Card device nodes.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied, thanks!

