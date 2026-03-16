Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3537282F1D
	for <imx@lists.linux.dev>; Mon, 16 Mar 2026 14:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773671334; cv=none; b=FdluwuUscLE/gZcgdRH5WkorKFZqgiHctkQeER79ShlUfYCZlkMVs1NIzmvNTR+aQNByEUHmXC3T6FXS654+2JSrfQtu1wMZZM5/OIcN/ahH2xRaBltJ0V8sPZI0nubbNhJtSWWrM3ZtE3CvOq/vOLLJg+zyA84OnWJOqWhkuO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773671334; c=relaxed/simple;
	bh=9jY+eCJj6CYgBhKMzWT15r/jl4hqzZepeKhweN7uMLY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LYAYaMePrvfDUdagS8RuuMZvFCnDIWaefVpINDLLcYM0yQdfe+B1/lsVEsv4d4maLyYtJx83RQQ9HTczmLPGLdhnDC6CP0DJiP32nVrVjU7ni7dOtx9Km+H5+UCz3Yq0ddaeoPBjliWVdcuOzmshg3q0M6W2HfClKePYP7f3+f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=Ybshd+Ti; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="Ybshd+Ti"
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1w28w1-0000000BICr-18Qs
	for imx@lists.linux.dev;
	Mon, 16 Mar 2026 15:28:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=air3Q0t7O2WJG3HbRSFLNzGNy7QbzEyh9W7ZWhP6oVw=; b=Ybshd+TiroQNNN3JCYUSqMiH8/
	bjin/kxTRyK7WBf9XlE4EQqTBKWhnh/z6VsC+eAE++m3Zzp+cGMFLwEqCzbpSBPZkJq8bhGPigf+d
	qMcA3HPaEceECha2M9h3YRAjF5OHE4EbMT+JgoPGfbC9cEYes9oGzf4JQli/c0gG1K6t5k8vYb4cU
	h7yz4PcJzfgtJ41uM8neELeboamPnPuN/VA45gWxZqqwvAFwtIsI/+ui56c3ioR0nBZhgYA+hyWEO
	3FDRMsZ9nH6yOthMi7h+yvfhveybINPV6sl7D41GkdsJNEdFoN0BrH4o3Kzr2J0RJBmjj0aoYwUCS
	rT3cJHVg==;
Date: Mon, 16 Mar 2026 15:28:31 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Conor Dooley <conor@kernel.org>
Cc: Robby Cai <robby.cai@nxp.com>, broonie@kernel.org, lgirdwood@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev
Subject: Re: [PATCH v2 2/2] regulator: fp9931: Fix handling of mandatory
 "vin" supply
Message-ID: <20260316152831.7c1d4ed6@kemnade.info>
In-Reply-To: <20260313-antler-unburned-3af789df6085@spud>
References: <20260313133102.2749890-1-robby.cai@nxp.com>
	<20260313133102.2749890-3-robby.cai@nxp.com>
	<20260313-antler-unburned-3af789df6085@spud>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 13 Mar 2026 17:24:31 +0000
Conor Dooley <conor@kernel.org> wrote:

> On Fri, Mar 13, 2026 at 09:31:02PM +0800, Robby Cai wrote:
> > The FP9931 requires a mandatory "vin" power supply to operate.
> > Replace devm_regulator_get_optional() with devm_regulator_get() to
> > enforce this mandatory dependency.
> > 
> > Fixes: 12d821bd13d42 ("regulator: Add FP9931/JD9930 driver")
> > Signed-off-by: Robby Cai <robby.cai@nxp.com>
> > ---
> >  drivers/regulator/fp9931.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/regulator/fp9931.c b/drivers/regulator/fp9931.c
> > index 69b3c712e5d58..d4ba818ec2c15 100644
> > --- a/drivers/regulator/fp9931.c
> > +++ b/drivers/regulator/fp9931.c
> > @@ -444,7 +444,7 @@ static int fp9931_probe(struct i2c_client *client)
> >  		return dev_err_probe(&client->dev, PTR_ERR(data->regmap),
> >  				     "failed to allocate regmap!\n");
> >  
> > -	data->vin_reg = devm_regulator_get_optional(&client->dev, "vin");
> > +	data->vin_reg = devm_regulator_get(&client->dev, "vin");  
> 
> And this isn't an ABI break because the regulator core will invent a
> dummy regulator?
> 
On most devices I see a dummy regulator somewhere.

What IMHO itches more is that one has to invent a regulator in devicetree
if the property is mandatory and the supply is not known, you have to add
a dummy regulator in the devicetree to make dtbs_check happy.

Regards,
Andreas
