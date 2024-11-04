Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C868199956
	for <imx@lists.linux.dev>; Mon,  4 Nov 2024 07:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730706016; cv=none; b=BriwgpZjXmaz4oaUN5pksVWfIJ0xOOl4layUoguYmdYKx0LhLuHTHe3hwQeygEH7YSQ4uaiqjOlilZxctuAUCCI4DU4hTQT5IBA24SOVq4v7zDOgFXbhgDrDEIlHYCW+GgVhu9UTX/5Ij45IZlQachtJ2oyjpDnbAjnsdvPen/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730706016; c=relaxed/simple;
	bh=Ntkiw9l8fdEswuek+7PtdJmfxjlvNWhTJmMdu+rLc4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fym7Qt8CaP1wH+wsQs8sxoJueMbaWQH5Ux8X59ZY4ZF32Wbx/RlX7XQ4LkzrI5+OdJT+4ZaFNRDHJBh2ypGsE4NDwEhH/gW3eSve+DYR115wpIinYEy05Ii9uULmmWkY3wgFGMnQY27DMIRDiTQD+jUsEP0LB6PZOBVMIJzgNy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=gvGGCXOi; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="gvGGCXOi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=IZRpCxs1ZQTmZewSRGTv8tKfeNyI4SPc6Zju2MFK6Jg=;
	b=gvGGCXOiiOnY2rDmLIb1mGs6sM8ngd9H+Ubx8cwyBOCLGJZw7qlZOcuunFvutj
	4sonau3Vgnse4MItd3uIgjEAiNbE5MF82l2WMU4mLBUjPU5CRVmainI+IQUwOmIj
	NT8+pqAbZunxJG2GNOoxnRt0pe7iaKxfOz6SzpeSAUuRo=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCnT+o6eihndZamAQ--.16521S3;
	Mon, 04 Nov 2024 15:39:40 +0800 (CST)
Date: Mon, 4 Nov 2024 15:39:38 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: alice.guo@oss.nxp.com
Cc: alexander.stein@ew.tq-group.com, wahrenst@gmx.net, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, "alice.guo" <alice.guo@nxp.com>
Subject: Re: [PATCH v4] soc: imx: Add SoC device register for i.MX9
Message-ID: <Zyh6Oi+3cPXmMjz6@dragon>
References: <20241031065438.3912960-1-alice.guo@oss.nxp.com>
 <ZydAVhFvHWCk6oNH@dragon>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZydAVhFvHWCk6oNH@dragon>
X-CM-TRANSID:Mc8vCgCnT+o6eihndZamAQ--.16521S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFyrArW3tw1UGryrAryftFb_yoWfAFX_uF
	1DC34UWr1vgF4xuwn5Crn3ZFyftw1UXF98JrnFkFWfWry5Crn8JFs7X34fta1xW397tFy7
	CF1Sqr4FvwnxKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUn6wZ7UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRCNZWcoYCtN+gABsD

On Sun, Nov 03, 2024 at 05:20:22PM +0800, Shawn Guo wrote:
> On Thu, Oct 31, 2024 at 02:54:38PM +0800, alice.guo@oss.nxp.com wrote:
> > From: "alice.guo" <alice.guo@nxp.com>
> > 
> > i.MX9 SoCs have SoC ID, SoC revision number and chip unique identifier
> > which are provided by the corresponding ARM trusted firmware API. This
> > patch intends to use SMC call to obtain these information and then
> > register i.MX9 SoC as a device.
> > 
> > Signed-off-by: alice.guo <alice.guo@nxp.com>
> > Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
> 
> Applied, thanks!

I have to drop it for now, as I just recall that we should probe SoC
driver as platform driver.  Could you rework it a bit like what Marek
has done for soc-imx8m driver?

https://patchwork.kernel.org/project/imx/patch/20240929184930.73049-1-marex@denx.de/

Shawn

