Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B5A01B815
	for <imx@lists.linux.dev>; Tue, 13 Aug 2024 02:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723517346; cv=none; b=CK0rEFvAhAml0C1fYOf4rWj5m9sR9q5XUj2L1e+uxfkdM0Oqe27Ku+DxIVCX9j+UrU+mEX9oflQqb/TmS0vvtbcp3goGVj8KCGzdq4sEPJ1Aet4Q6lkjOfgcXh931JCJitI17J1/2n9skoaGm6OnVXnXnwfaarIZH6ndCdsKZgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723517346; c=relaxed/simple;
	bh=sXp6YddTODBVzlnCvVgBh98L85fjzrGiv+X1+cmMRBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bA8oIanke/dPSezJL4ODp9uLSlG57sT6QLtUaa+Mxqoe5PR+S5g803qO0zV14bVVx96H5LuYoorYsdMcikQXA7ysyAAPN8ORUea2MBjeGGjAw3rPorZg9nrQpHCnEDUmhxNZrChZYQgDsX+cs81RMdvdizgF52X/NImuYyTQcbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=hI4xmBB9; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="hI4xmBB9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=KFNCvveRopBL4M4RjwAKxrwlHBT+Ho9SPPnEkeplJbU=;
	b=hI4xmBB9wBLbBbTvLkysHzKLD4r+pDYjcFIrixHwLInFKTTuaUMUXe2mQLR1KC
	nJF3/jIphw4Tthj+EdrIWkOxYqKMGvVnTcOprK59MfWFMu9cVZ45rdwZC9Ki+uEx
	eapjt/CuzaKRjyBDTTCRTlgsd5Q2f/1ksQPf+shaY92L4=
Received: from dragon (unknown [117.62.10.86])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDXHy2MybpmpkVSAg--.46498S3;
	Tue, 13 Aug 2024 10:48:46 +0800 (CST)
Date: Tue, 13 Aug 2024 10:48:44 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com
Subject: Re: [PATCH v2 0/4] arm64: dts: imx93-11x11-evk: Add several sound
 cards
Message-ID: <ZrrJjPmix3Dp+wEK@dragon>
References: <1722217199-10640-1-git-send-email-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1722217199-10640-1-git-send-email-shengjiu.wang@nxp.com>
X-CM-TRANSID:Mc8vCgDXHy2MybpmpkVSAg--.46498S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU-rb1UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiER46ZWa6xSATFAAAsu

On Mon, Jul 29, 2024 at 09:39:55AM +0800, Shengjiu Wang wrote:
> Add bt-sco, PDM microphone, XCVR sound card support.
> 
> changes in v2:
> - move #sound-dai-cells to i.mx93.dtsi
> - fix some coding style issue
> - fix CHECK_DTBS issue
> 
> Shengjiu Wang (4):
>   arm64: dts: imx93: Add #sound-dai-cells property
>   arm64: dts: imx93-11x11-evk: add bt-sco sound card support
>   arm64: dts: imx93-11x11-evk: Add PDM microphone sound card support
>   arm64: dts: imx93-11x11-evk: Add audio XCVR sound card

Applied all, thanks!

