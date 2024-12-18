Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8481517C219
	for <imx@lists.linux.dev>; Wed, 18 Dec 2024 14:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734531073; cv=none; b=inp15lzPZDLDxQc6cyvK7TqWzjf9nreczWNXSOrijqIcyoNFlB8Ppmpi7Fnwy1XSFIpL+kYi8UE5TL+u+UuTJKJu2n0/ZR5m7JRjNZBikJ4860e3fyLi3gvQmC15nfwPK+rsysB+p8yXUkkzxQnKi34EBAzSLiXpQI/rdJpv0FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734531073; c=relaxed/simple;
	bh=wo/P4xgEqkceHS80Y2/yVz/sJ02F/ny4DRdoJ62OaFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ce2m+hi/LJvlp4yRAVZfKPp1ucDTiciS9SE353WBwrVc8GliqNDMReZbrZS5Ogqlgcn/FqIE+ZZuS9R3eCvlPNW+6pdUht3Q89ip1cMbMVJP1rHcVuifuqj/bnR0Uby75XQQzvFiawuB8FtmQo6RIzsGqtnXPD3xIkmzLik+wYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=E9ePbm5Q; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="E9ePbm5Q"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 0F8271F920;
	Wed, 18 Dec 2024 15:11:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1734531066;
	bh=wo/P4xgEqkceHS80Y2/yVz/sJ02F/ny4DRdoJ62OaFM=; h=From:To:Subject;
	b=E9ePbm5QKgYj7jlcDf1uV0m/3cLRT1vDCO9ftZM9Lwo8ZEX3tK70SF+LlMp1kFJHt
	 11ZVz2Im7eYBbH0G4DazF2w4H0uCtmAYEvGMZ9bt6jxmjXQQ7FgP0meQeROtVYeN1b
	 kFBIhDxZmAlQ3peoLX5LTb+GGr6nUEUlwSzUHMYNTXNzF2nyHf6xtb7N/U+0A4ZX80
	 Fkw/b6Wn1vCQ5/vsAl1eL1indq8YTbjY2l+bN05YuDy3sO723jfxzKGrP1drhEnSWG
	 NrkGP+SHa3+uJnK+taWNG4ccMqAnncmADdZvs9G8wIc6lmaou7TK+ZOVh3ANnFLtCm
	 HCm8jGVRJwh2g==
Date: Wed, 18 Dec 2024 15:11:01 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.li@nxp.com>, Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev
Subject: Re: panel-lvds for imx8mm-verdin boards
Message-ID: <20241218141101.GA25083@francesco-nb>
References: <ZxK1yAZkJOTQN++s@lizhi-Precision-Tower-5810>
 <CAOMZO5AcyVeq8TN9qK=_54gP6y_rrCLjh22LnA=E6pLnxjbpNw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMZO5AcyVeq8TN9qK=_54gP6y_rrCLjh22LnA=E6pLnxjbpNw@mail.gmail.com>

Hello Frank,

On Fri, Oct 18, 2024 at 06:13:07PM -0300, Fabio Estevam wrote:
> On Fri, Oct 18, 2024 at 4:24 PM Frank Li <Frank.li@nxp.com> wrote:
> >
> > There are some dtb check warning
> >
> > arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb: panel-lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
> >
> > Can you help add actual pannel-lvds compatible string to clean up these
> > warning?

I do not think that allowing just panel-lvds in the compatible is going
to be fine from the DT maintainer point of view.

Adding a specific compatible will not solve the issue, because we can
connect different kind of display there. Doing this will get rid of the
warning however.

We could remove the node completely, but this would create some
regression we need to figure out how to handle, minimizing the impact.

Unfortunate there is not a perfect solution, IMO the best solution is to
remove the node, but I need to find some time to look into the evil
details.

Francesco


