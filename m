Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795588047;
	b=3w90pK9Z7teVO7VQdtUdyJJb3aUBS5gb3F+DTUOcmpwH1IwJbxc42nlD4iiJEddcGiqd
	 yjAWzIWgXuiXgDIAED9pz7MoBiUo89R0ux3SmBqf2FBM0NIlmpliynmyK/pvgjESNlp9D
	 qOiZr6Ftylqn0kTVyeSTifRXZtMFad8kU81DcoM7ER6V/KAAfTlBF7ZhHFs7PryUREl9q
	 zRn10udItj29g/fOQkAvACdDqfOv39bgN4Foe99C2Wq/Km177u9Wh7cEm8J/N65tfrDtW
	 CjvIjNq8RPLOaAqH8+zKDxKw73E7oLdCVKF2dusqacYNk5KDcn3UIDH6oxAyi+nf5nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795588047;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=AU+xmySVJwBz+pegtgSSaDJocnDH0B/Soc9pn7c5sw8=;
	b=WF4LdvfTSZIdyURGl0Ls9/WDnJCYQpp8TNdOVgidz5E6iTcEXH+Wb0G5kDdlvdmM+SIV
	 6dJkQBz5We1HMj3P0q9gEx6BfD/bz+knDC3iBumB0a0X7zMxboguwpQWfynqP3+eY1wYH
	 uQXiQy7RuxO01tcYXE4ulvyT3TZPpi9MAzViuTMLkd7P2IwM4jKRNaoffMgHtwYb3ptEn
	 +5cDYlyYwT3VGLu/7p4ns+G+ez2iZkrUO6jJ8hRYOmdiek+/gcyA118y78Fye3Wkfm9Cg
	 DNJ110/DkLfjrC3jNA7jpi2KimTCSO1ZMjNvoGZ6UOo1swiKlaO+cW14wv515rm5wkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UeIdkJa1;
	arc=none smtp.remote-ip=95.215.58.43
Received: from mta1.migadu.com (out-43.mta1.migadu.com [95.215.58.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC588606A68B
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 06:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC588606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UeIdkJa1
X-Envelope-To: imx@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=5kUkpPIngb1Lqhb1eeDn3g9ch6Zc8QWQ/kG5d4vck8I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795588044; v=1; x=1796192844;
 b=UeIdkJa18p5M5bABun8xB1/9Dy2hGRspsyFwEqeB0LmEcdu0a1i0Qw/LDnW8DFPf1YzC1Skl
 1K93eC3YKWOxc6eheo0mWF3MvpLC2JWX72KAFLHWQpKycTmtuIGN5dGI+wN/vj+hDa3wDZkbLyn
 8utxqCpJbTlV/JuhFlzCIJOg=
X-Envelope-To: imx@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id f7f75fb0eec3c447;
	Wed, 25 Nov 2026 06:27:24 +0000
X-Mizu-Trace-ID: f7f75fb0eec3c447
X-Migadu-Flow: FLOW_OUT
Date: Wed, 25 Nov 2026 07:27:18 +0100
From: Richard Leitner <richard.leitner@linux.dev>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Lee Jones <lee@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	Oleksij Rempel <o.rempel@pengutronix.de>, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 05/10] remoteproc: imx_rproc: Avoid stale mailbox
 pointers on request failure
Message-ID: <awZ_HjrhS3Uiyssd@bombadil>
References: <20261123172140.3547896-6-lee@kernel.org>
 <20261124032344.5314-1-peng.fan@oss.nxp.com>
 <awZ-XC1efo5QQvNI@bombadil>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <awZ-XC1efo5QQvNI@bombadil>

On Wed, Nov 25, 2026 at 07:23:37AM +0100, Richard Leitner wrote:
> Hi Lee, Hi Peng,
> 
> On Tue, Nov 24, 2026 at 11:23:41AM +0800, Peng Fan (OSS) wrote:
> > Hi Lee,
> > On Mon, 23 Nov 2026 17:20:49 +0000 Lee Jones <lee@kernel.org> wrote:
> > 
> > > imx_rproc_xtr_mbox_init() stores the result of
> > > mbox_request_channel_byname() directly into priv->tx_ch and priv->rx_ch.
> > > Because mailbox channels are freed on stop() and detach() and
> > > re-requested on start(), attach(), and system shutdown, a failure while
> > > requesting "tx" leaves an ERR_PTR in priv->tx_ch, which is later
> > > dereferenced by imx_rproc_kick() and imx_rproc_free_mbox().  If "rx"
> > > fails after "tx" succeeds, priv->tx_ch is freed without being cleared
> > > while priv->rx_ch retains an ERR_PTR, causing subsequent calls to see
> > > both pointers as non-NULL and skip initialisation, leading to a
> > > use-after-free on priv->tx_ch and an ERR_PTR dereference on priv->rx_ch.
> > > 
> > > Request both channels into local variables and assign priv->tx_ch and
> > > priv->rx_ch only after both requests succeed.
> > 
> > I think Richard Leitner <richard.leitner@linux.dev> is working on this.
> > 
> > https://lore.kernel.org/linux-remoteproc/CANLsYkx=M_TXN10qAcQC0be065TYnzfOae6E8ss-9DTj9MzogA@mail.gmail.com/T/#ma2f8e4c332d47e5bdd1787f82f4dd2feeafc67d6
> 
> AFAICT my series fixes a similar, but other problem. Mine is about the
> free'ing order and a possible race when a kick occurs during
> cleanup/close. This one is targeted towards the setup/initialisation.
> Therefore IMHO this is a valid, fix for a different problem than mine.
> 
> What's your opinion on this Lee?

Sorry, was too quick with answering and messed up things, as this fixes the
sashiko finding, not the "my" initial bug. So for me it's fine if we keep
this one, as I have not sended mine yet. ;-)

Therefore please feel free to add:

Reviewed-by: Richard Leitner <richard.leitner@linux.dev>

> 
> reagards;rl
> 
> > 
> > Regards
> > Peng
> > 
> > > 
> > > Fixes: 99b142cf7191 ("remoteproc: imx_rproc: Request mbox channel later")
> > > Closes: https://sashiko.dev/#/bug/linux-ac0f248a-bdfd-41da-95f8-44b8f1f7091d
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Lee Jones <lee@kernel.org>
> > > ---
> > >  drivers/remoteproc/imx_rproc.c | 18 +++++++++++-------
> > >  1 file changed, 11 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > > index 581bb07f5893..a77a3342e1ed 100644
> > > --- a/drivers/remoteproc/imx_rproc.c
> > > +++ b/drivers/remoteproc/imx_rproc.c
> > > @@ -875,6 +875,7 @@ static void imx_rproc_rx_callback(struct mbox_client *cl, void *msg)
> > >  static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block)
> > >  {
> > >  	struct imx_rproc *priv = rproc->priv;
> > > +	struct mbox_chan *tx_ch, *rx_ch;
> > >  	struct device *dev = priv->dev;
> > >  	struct mbox_client *cl;
> > >  
> > > @@ -900,18 +901,21 @@ static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block)
> > >  	cl->knows_txdone = false;
> > >  	cl->rx_callback = imx_rproc_rx_callback;
> > >  
> > > -	priv->tx_ch = mbox_request_channel_byname(cl, "tx");
> > > -	if (IS_ERR(priv->tx_ch))
> > > -		return dev_err_probe(cl->dev, PTR_ERR(priv->tx_ch),
> > > +	tx_ch = mbox_request_channel_byname(cl, "tx");
> > > +	if (IS_ERR(tx_ch))
> > > +		return dev_err_probe(cl->dev, PTR_ERR(tx_ch),
> > >  				     "failed to request tx mailbox channel\n");
> > >  
> > > -	priv->rx_ch = mbox_request_channel_byname(cl, "rx");
> > > -	if (IS_ERR(priv->rx_ch)) {
> > > -		mbox_free_channel(priv->tx_ch);
> > > -		return dev_err_probe(cl->dev, PTR_ERR(priv->rx_ch),
> > > +	rx_ch = mbox_request_channel_byname(cl, "rx");
> > > +	if (IS_ERR(rx_ch)) {
> > > +		mbox_free_channel(tx_ch);
> > > +		return dev_err_probe(cl->dev, PTR_ERR(rx_ch),
> > >  				     "failed to request rx mailbox channel\n");
> > >  	}
> > >  
> > > +	priv->tx_ch = tx_ch;
> > > +	priv->rx_ch = rx_ch;
> > > +
> > >  	return 0;
> > >  }
> > >  
> > > -- 
> > > 2.56.1.750.gf70dc682cf-goog
> > 
> > Sent using hkml (https://github.com/sjp38/hackermail)
