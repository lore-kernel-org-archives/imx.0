Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795607600;
	b=rZLPANBmwXuRpP+fGFOrGXteOmnT4M4rekeSTAWRvRbR9CrjUCZec2tz87QhX/+5Zicn
	 q114046E2oPhn97Xnhv79uqvY+gbgCNxIGtMnEEsE3fnZwRFmaJTTTCT+piuT1wqibHpp
	 DbLUTlUjVF1pIKz1LXowHM3PIo03HQMJ3dlY4pYkvo+QDQcNg7gAY7VYUwN/h545pWRyv
	 3Y9/IodewSZPKnconUtnUAJJtLMsSQlbQm1Uk9oWHpmhEjdvuH+vowoY31xOhaZhVwOCu
	 WvFKK35SQg1xnzOBHOQAXT/dA4dU6FVqcOxkbDI32DTEXdMegXGCj55oSD8gwzSg5zA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607600;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=nZYqcXr2GdukwpFTErUn0OmrkaYloPVQ2+2wDZ49QlA=;
	b=5G6RyzT8W1i21RPgQodYInuJM0e2/wTNPSBgeP+pAP84SQnk3OT+sGbR7XnH6buuA6un
	 yxZxsB0Op4cuvbNoJCHrWYgEgrFdFcelQcjQiGVc/EK/7rViZm2XRRTmb7SGn8WIC6l7A
	 za4ZrWws8bsr5kyoSY0eKb0xTgDE0QT7meEMCXu9Je5crwgmLLukXUJDTnQ5tj5brESYc
	 ijXjw1G4UW+bK2HlT/Vvua0BoHD0EFPfCoDsFNjSavn/hCZk98wYVJwEdeRS+dNt3ku1q
	 ncnqEnxsNtY4pwJNZazXQ8xY1g3GEhol7Hi1tUTuMfsai6e5jtSeafLNz6qnjSGJihw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=PbHBDqbp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F1A606A323
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 11:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55F1A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=PbHBDqbp
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 709292001A0;
	Wed, 25 Nov 2026 12:53:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795607597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nZYqcXr2GdukwpFTErUn0OmrkaYloPVQ2+2wDZ49QlA=;
	b=PbHBDqbpyGECAjnBhCSKie8KEBk6a64mLAmKCjN9MhceQnQLcrCHIv1lWy4dsHMLH7XhCE
	i7TA6RhFLtxLEYbEcwf2HFA7Wj6CaJArkV2lWfdP7+mK3TnTwq1S492/LHQcYz6WFJfcEz
	md1WEtrCvehRoL5KdmhAT2MVjrjHEAeI4cw6ZbS689B+l2BuHRBFpNNGc+NiSCYtQRlhwL
	j9UGlcSG4SAdQW921O5UwKs9uJDhEHmWyrIJ7Vl7YDRTGdqSgxpd98m6+B2ZxtWN8Pvkdc
	O3LLlXqK2U0/6XEkJvWj1XM0g8rOe270BkncmUe3DVie5FNUD0fVaWDv50EBwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795607597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nZYqcXr2GdukwpFTErUn0OmrkaYloPVQ2+2wDZ49QlA=;
	b=ZhsFPfuflVaq19jR2oqz2SK81or7T0A+XwZ885vj4fQnX06TrUCuu9viC+91pNH6aZ9aEv
	2dmw2g7OkMPZtoX7RKV3h5LUyUZNehorlLp2NK/Fh/UXKGvyYxxHU2nwTQxkU+WkyL7cqg
	t30DTWkVXMmeZ0jVrCCjiylTlJxhl3y+2kAWKVSaKvqqdx8XViS8Bn35snJOjfbK3YyA1y
	Yy5CJMn2OzkLeosZkGYLyc288kswAWlpVN/doYIeKms8D4aCPzqySQJG+yK4BsDgtNIirm
	3mKg4+XezcAMutGh2r8v3GC1+521es9LvbJCj9q/eNluFzykQUfSGIU4R5kpaQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795607597; a=rsa-sha256;
	cv=none;
	b=MHanYjsJA6XhzZw6heWfVaTzUOjh7E20PH1/UuZqp4HPoLzaCZg1z7NsXKK1B/evAW8uhN
	2zseWkcyNBN4sCXpUi8n8CempZWiJ3UYvL8DYeukJdzD//9IHUbKdOI465jvu1tRBeg1S/
	kZ+BCVqfozR0dUkbR02T+KZEMq/AFTVuS1KlQ/TFpA+b+6ukmpP2ZDSZkTFw2ZrLbdtPwd
	CKzJZaS7s3aGxHFt2MZS9n6YtMK/R+n8bXgan/wwzKnHSDDfTqlo1rghERn+LGRHva9tf+
	g9g/aTsiUWczsocRZfHA77NFkH2rTJ2kEvOnFEZH+aL6a3uSehBH1E6nnO85yA==
Message-ID: <508510a91e4b23d5d78f2844edaa0176a0a0d7d2.camel@pengutronix.de>
Subject: Re: Re: [PATCH] media: coda: Fix potential use-after-free after
 VDOA removal
From: Philipp Zabel <p.zabel@pengutronix.de>
To: =?UTF-8?Q?=E6=9D=8E=E5=B9=BF=E7=A1=95?= <liguangshuo@mail.sdu.edu.cn>, 
 Frank Li <Frank.li@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>,
  Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam	 <festevam@gmail.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Date: Wed, 25 Nov 2026 12:53:17 +0100
In-Reply-To: <AFIAnACwLNbQUd1pcUL4gqo0.3.1795528942002.Hmail.202321181@mail.sdu.edu.cn>
References: <20261107-0d0c29e10a-media-coda-1@mail.sdu.edu.cn>
	 <av9mwwAmlRoDdU0d@lizhi-Precision-Tower-5810>
	 <AFIAnACwLNbQUd1pcUL4gqo0.3.1795528942002.Hmail.202321181@mail.sdu.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Di, 2026-11-24 at 22:02 +0800, =E6=9D=8E=E5=B9=BF=E7=A1=95 wrote:
> Hi Frank,
>=20
> Thanks for the review.
>=20
> From: Frank Li <Frank.li@oss.nxp.com>
> Date: 2026-11-20 05:14:43
> To:  Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
> Cc:  Philipp Zabel <p.zabel@pengutronix.de>,Mauro Carvalho Chehab <mcheha=
b@kernel.org>,Frank Li <Frank.Li@nxp.com>,Sascha Hauer <s.hauer@pengutronix=
.de>,Pengutronix Kernel Team <kernel@pengutronix.de>,Fabio Estevam <festeva=
m@gmail.com>,linux-media@vger.kernel.org,linux-kernel@vger.kernel.org,imx@l=
ists.linux.dev,linux-arm-kernel@lists.infradead.org
> Subject: Re: [PATCH] media: coda: Fix potential use-after-free after VDOA=
 removal>On Sat, Nov 07, 2026 at 02:54:30PM +0800, Guangshuo Li wrote:
> > > VDOA can be unbound while CODA still holds its driver data and open
> > > contexts. Their next transfer or close then accesses released state
> > > and device-managed resources.
> > >=20
> > > Retain the VDOA state for its consumers and contexts. Serialize hardw=
are
> > > access with removal, stop outstanding transfers and balance the clock
> > > references before disconnecting the retained contexts. Also release a
> > > VDOA context when opening CODA fails.
> > >=20
> > > This issue was found by our static analysis tool under development.
> > >=20
> > > Fixes: e7f3c5481035 ("[media] coda: use VDOA for un-tiling custom mac=
roblock format")
> > > Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
> > > ---
> > > Validation: x86-64 GCC W=3D1 changed-object compilation passed. An
> > > extracted-code test with mocked services reports an ASan failure befo=
re
> > > the fix and passes after it; this is not a kernel reproducer. No
> > > hardware test, ARM64 build or full linked-kernel build.
> > > OpenAI Codex assisted with source review, patch implementation and
> > > commit-message drafting. The submitter has reviewed the changes.
> > >=20
> > >  .../platform/chips-media/coda/coda-common.c   |  14 +-
> > >  .../platform/chips-media/coda/imx-vdoa.c      | 133 ++++++++++++++++=
--
> > >  .../platform/chips-media/coda/imx-vdoa.h      |   8 ++
> > >  3 files changed, 134 insertions(+), 21 deletions(-)
> > >=20
> > > diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/=
drivers/media/platform/chips-media/coda/coda-common.c
> > > index be37ea568bfe..b519cf8541de 100644
> > > --- a/drivers/media/platform/chips-media/coda/coda-common.c
> > > +++ b/drivers/media/platform/chips-media/coda/coda-common.c
> > > @@ -396,7 +396,7 @@ const char *coda_product_name(int product)
> > >  	}
> > >  }
> > >=20
> > > -static struct vdoa_data *coda_get_vdoa_data(void)
> > > +static struct vdoa_data *coda_get_vdoa_data(struct device *dev)
> > >  {
> > >  	struct device_node *vdoa_node;
> > >  	struct platform_device *vdoa_pdev;
> > > @@ -410,9 +410,7 @@ static struct vdoa_data *coda_get_vdoa_data(void)
> > >  	if (!vdoa_pdev)
> > >  		goto out;
> > >=20
> > > -	vdoa_data =3D platform_get_drvdata(vdoa_pdev);
> > > -	if (!vdoa_data)
> > > -		vdoa_data =3D ERR_PTR(-EPROBE_DEFER);
> > > +	vdoa_data =3D devm_vdoa_get(dev, &vdoa_pdev->dev);
> > >=20
> > >  	put_device(&vdoa_pdev->dev);
> > >  out:
> > > @@ -2721,6 +2719,8 @@ static int coda_open(struct file *file)
> > >  err_clk_enable:
> > >  	pm_runtime_put_sync(dev->dev);
> > >  err_pm_get:
> > > +	if (ctx->vdoa)
> > > +		vdoa_context_destroy(ctx->vdoa);
> > >  	v4l2_fh_del(&ctx->fh, file);
> > >  	v4l2_fh_exit(&ctx->fh);
> > >  err_coda_name_init:
> > > @@ -3220,9 +3220,9 @@ static int coda_probe(struct platform_device *p=
dev)
> > >  	dev->iram_pool =3D pool;
> > >=20
> > >  	/* Get vdoa_data if supported by the platform */
> > > -	dev->vdoa =3D coda_get_vdoa_data();
> > > -	if (PTR_ERR(dev->vdoa) =3D=3D -EPROBE_DEFER)
> > > -		return -EPROBE_DEFER;
> > > +	dev->vdoa =3D coda_get_vdoa_data(&pdev->dev);
> > > +	if (IS_ERR(dev->vdoa))
> > > +		return PTR_ERR(dev->vdoa);
> > >=20
> > >  	ret =3D v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
> > >  	if (ret)
> > > diff --git a/drivers/media/platform/chips-media/coda/imx-vdoa.c b/dri=
vers/media/platform/chips-media/coda/imx-vdoa.c
> > > index cd085c1c73f4..d9249c943dfa 100644
> > > --- a/drivers/media/platform/chips-media/coda/imx-vdoa.c
> > > +++ b/drivers/media/platform/chips-media/coda/imx-vdoa.c
> > > @@ -9,7 +9,9 @@
> > >  #include <linux/clk.h>
> > >  #include <linux/device.h>
> > >  #include <linux/interrupt.h>
> > > +#include <linux/kref.h>
> > >  #include <linux/module.h>
> > > +#include <linux/mutex.h>
> > >  #include <linux/dma-mapping.h>
> > >  #include <linux/platform_device.h>
> > >  #include <linux/videodev2.h>
> > > @@ -74,6 +76,12 @@ enum {
> > >  };
> > >=20
> > >  struct vdoa_data {
> > > +	struct kref		ref;
> > > +	/* Serializes context hardware access with removal. */
> > > +	struct mutex		lock;
> > > +	unsigned int		num_contexts;
> > > +	bool			removed;
> > > +	int			irq;
> > >  	struct vdoa_ctx		*curr_ctx;
> > >  	struct device		*dev;
> > >  	struct clk		*vdoa_clk;
> > > @@ -126,7 +134,7 @@ static irqreturn_t vdoa_irq_handler(int irq, void=
 *data)
> > >  	return IRQ_HANDLED;
> > >  }
> > >=20
> > > -int vdoa_wait_for_completion(struct vdoa_ctx *ctx)
> > > +static int vdoa_wait(struct vdoa_ctx *ctx)
> > >  {
> > >  	struct vdoa_data *vdoa =3D ctx->vdoa;
> > >=20
> > > @@ -142,17 +150,43 @@ int vdoa_wait_for_completion(struct vdoa_ctx *c=
tx)
> > >=20
> > >  	return 0;
> > >  }
> > > +
> > > +int vdoa_wait_for_completion(struct vdoa_ctx *ctx)
> > > +{
> > > +	struct vdoa_data *vdoa =3D ctx->vdoa;
> > > +	int ret;
> > > +
> > > +	mutex_lock(&vdoa->lock);
> > > +	ret =3D vdoa->removed ? -ENODEV : vdoa_wait(ctx);
> > > +	mutex_unlock(&vdoa->lock);
> > > +
> > > +	return ret;
> > > +}
> > >  EXPORT_SYMBOL(vdoa_wait_for_completion);
> > >=20
> > > +static void vdoa_stop(struct vdoa_data *vdoa)
> > > +{
> > > +	if (!vdoa->curr_ctx)
> > > +		return;
> > > +
> > > +	if (vdoa_wait(vdoa->curr_ctx))
> > > +		writel(VDOASRR_SWRST, vdoa->regs + VDOASRR);
> > > +	writel(0, vdoa->regs + VDOAIE);
> > > +	synchronize_irq(vdoa->irq);
> > > +	vdoa->curr_ctx =3D NULL;
> > > +}
> > > +
> > >  void vdoa_device_run(struct vdoa_ctx *ctx, dma_addr_t dst, dma_addr_=
t src)
> > >  {
> > >  	struct vdoa_q_data *src_q_data, *dst_q_data;
> > >  	struct vdoa_data *vdoa =3D ctx->vdoa;
> > >  	u32 val;
> > >=20
> > > -	if (vdoa->curr_ctx)
> > > -		vdoa_wait_for_completion(vdoa->curr_ctx);
> > > +	mutex_lock(&vdoa->lock);
> >=20
> > use cleanup guard()
> >=20
> > > +	if (vdoa->removed)
> > > +		goto out_unlock;
> > >=20
> > > +	vdoa_stop(vdoa);
> > >  	vdoa->curr_ctx =3D ctx;
> > >=20
> > >  	reinit_completion(&ctx->completion);
> > > @@ -192,9 +226,44 @@ void vdoa_device_run(struct vdoa_ctx *ctx, dma_a=
ddr_t dst, dma_addr_t src)
> > >  	/* Enable interrupts and start transfer */
> > >  	writel(VDOAIE_EITERR | VDOAIE_EIEOT, vdoa->regs + VDOAIE);
> > >  	writel(VDOASRR_START, vdoa->regs + VDOASRR);
> > > +out_unlock:
> > > +	mutex_unlock(&vdoa->lock);
> > >  }
> > >  EXPORT_SYMBOL(vdoa_device_run);
> > >=20
> > > +static void vdoa_release(struct kref *ref)
> > > +{
> > > +	struct vdoa_data *vdoa =3D container_of(ref, struct vdoa_data, ref)=
;
> > > +
> > > +	put_device(vdoa->dev);
> > > +	kfree(vdoa);
> > > +}
> > > +
> > > +static void vdoa_put(void *data)
> > > +{
> > > +	struct vdoa_data *vdoa =3D data;
> > > +
> > > +	kref_put(&vdoa->ref, vdoa_release);
> > > +}
> > > +
> > > +struct vdoa_data *devm_vdoa_get(struct device *dev, struct device *s=
upplier)
> > > +{
> > > +	struct vdoa_data *vdoa;
> > > +	int ret;
> > > +
> > > +	device_lock(supplier);
> >=20
> > why not use device link ?
> >=20
> > > +	vdoa =3D dev_get_drvdata(supplier);
> > > +	if (vdoa)
> > > +		kref_get(&vdoa->ref);
> > > +	device_unlock(supplier);
> > > +	if (!vdoa)
> > > +		return ERR_PTR(-EPROBE_DEFER);
> > > +
> > > +	ret =3D devm_add_action_or_reset(dev, vdoa_put, vdoa);
> > > +	return ret ? ERR_PTR(ret) : vdoa;
> > > +}
> > > +EXPORT_SYMBOL(devm_vdoa_get);
> > > +
> > >  struct vdoa_ctx *vdoa_context_create(struct vdoa_data *vdoa)
> > >  {
> > >  	struct vdoa_ctx *ctx;
> > > @@ -204,16 +273,26 @@ struct vdoa_ctx *vdoa_context_create(struct vdo=
a_data *vdoa)
> > >  	if (!ctx)
> > >  		return NULL;
> > >=20
> > > +	mutex_lock(&vdoa->lock);
> > > +	if (vdoa->removed)
> > > +		goto err_unlock;
> > > +
> > >  	err =3D clk_prepare_enable(vdoa->vdoa_clk);
> > > -	if (err) {
> > > -		kfree(ctx);
> > > -		return NULL;
> > > -	}
> > > +	if (err)
> > > +		goto err_unlock;
> > >=20
> > > +	kref_get(&vdoa->ref);
> > > +	vdoa->num_contexts++;
> > >  	init_completion(&ctx->completion);
> > >  	ctx->vdoa =3D vdoa;
> > > +	mutex_unlock(&vdoa->lock);
> > >=20
> > >  	return ctx;
> > > +
> > > +err_unlock:
> > > +	mutex_unlock(&vdoa->lock);
> > > +	kfree(ctx);
> > > +	return NULL;
> > >  }
> > >  EXPORT_SYMBOL(vdoa_context_create);
> > >=20
> > > @@ -221,12 +300,15 @@ void vdoa_context_destroy(struct vdoa_ctx *ctx)
> > >  {
> > >  	struct vdoa_data *vdoa =3D ctx->vdoa;
> > >=20
> > > -	if (vdoa->curr_ctx =3D=3D ctx) {
> > > -		vdoa_wait_for_completion(vdoa->curr_ctx);
> > > -		vdoa->curr_ctx =3D NULL;
> > > +	mutex_lock(&vdoa->lock);
> > > +	if (!vdoa->removed) {
> > > +		if (vdoa->curr_ctx =3D=3D ctx)
> > > +			vdoa_stop(vdoa);
> > > +		clk_disable_unprepare(vdoa->vdoa_clk);
> > > +		vdoa->num_contexts--;
> > >  	}
> > > -
> > > -	clk_disable_unprepare(vdoa->vdoa_clk);
> > > +	mutex_unlock(&vdoa->lock);
> > > +	vdoa_put(vdoa);
> > >  	kfree(ctx);
> > >  }
> > >  EXPORT_SYMBOL(vdoa_context_destroy);
> > > @@ -291,11 +373,16 @@ static int vdoa_probe(struct platform_device *p=
dev)
> > >  		return ret;
> > >  	}
> > >=20
> > > -	vdoa =3D devm_kzalloc(&pdev->dev, sizeof(*vdoa), GFP_KERNEL);
> > > +	vdoa =3D kzalloc_obj(*vdoa);
> > >  	if (!vdoa)
> > >  		return -ENOMEM;
> > >=20
> > > -	vdoa->dev =3D &pdev->dev;
> > > +	vdoa->dev =3D get_device(&pdev->dev);
> > > +	kref_init(&vdoa->ref);
> > > +	mutex_init(&vdoa->lock);
> >=20
> > devm_mutex_init();
> >=20
> > Frank
> > > +	ret =3D devm_add_action_or_reset(&pdev->dev, vdoa_put, vdoa);
> > > +	if (ret)
> > > +		return ret;
> > >=20
> > >  	vdoa->vdoa_clk =3D devm_clk_get(vdoa->dev, NULL);
> > >  	if (IS_ERR(vdoa->vdoa_clk)) {
> > > @@ -310,6 +397,7 @@ static int vdoa_probe(struct platform_device *pde=
v)
> > >  	ret =3D platform_get_irq(pdev, 0);
> > >  	if (ret < 0)
> > >  		return ret;
> > > +	vdoa->irq =3D ret;
> > >  	ret =3D devm_request_threaded_irq(&pdev->dev, ret, NULL,
> > >  					vdoa_irq_handler, IRQF_ONESHOT,
> > >  					"vdoa", vdoa);
> > > @@ -323,6 +411,22 @@ static int vdoa_probe(struct platform_device *pd=
ev)
> > >  	return 0;
> > >  }
> > >=20
> > > +static void vdoa_remove(struct platform_device *pdev)
> > > +{
> > > +	struct vdoa_data *vdoa =3D platform_get_drvdata(pdev);
> > > +
> > > +	platform_set_drvdata(pdev, NULL);
> > > +	mutex_lock(&vdoa->lock);
> > > +	vdoa_stop(vdoa);
> > > +	disable_irq(vdoa->irq);
> > > +	while (vdoa->num_contexts) {
> > > +		clk_disable_unprepare(vdoa->vdoa_clk);
> > > +		vdoa->num_contexts--;
> > > +	}
> > > +	vdoa->removed =3D true;
> > > +	mutex_unlock(&vdoa->lock);
> > > +}
> > > +
> > >  static const struct of_device_id vdoa_dt_ids[] =3D {
> > >  	{ .compatible =3D "fsl,imx6q-vdoa" },
> > >  	{}
> > > @@ -331,6 +435,7 @@ MODULE_DEVICE_TABLE(of, vdoa_dt_ids);
> > >=20
> > >  static struct platform_driver vdoa_driver =3D {
> > >  	.probe		=3D vdoa_probe,
> > > +	.remove		=3D vdoa_remove,
> > >  	.driver		=3D {
> > >  		.name	=3D VDOA_NAME,
> > >  		.of_match_table =3D vdoa_dt_ids,
> > > diff --git a/drivers/media/platform/chips-media/coda/imx-vdoa.h b/dri=
vers/media/platform/chips-media/coda/imx-vdoa.h
> > > index a62eab476d58..e0ab414ddf5a 100644
> > > --- a/drivers/media/platform/chips-media/coda/imx-vdoa.h
> > > +++ b/drivers/media/platform/chips-media/coda/imx-vdoa.h
> > > @@ -6,11 +6,13 @@
> > >  #ifndef IMX_VDOA_H
> > >  #define IMX_VDOA_H
> > >=20
> > > +struct device;
> > >  struct vdoa_data;
> > >  struct vdoa_ctx;
> > >=20
> > >  #if (defined CONFIG_VIDEO_IMX_VDOA || defined CONFIG_VIDEO_IMX_VDOA_=
MODULE)
> > >=20
> > > +struct vdoa_data *devm_vdoa_get(struct device *dev, struct device *s=
upplier);
> > >  struct vdoa_ctx *vdoa_context_create(struct vdoa_data *vdoa);
> > >  int vdoa_context_configure(struct vdoa_ctx *ctx,
> > >  			   unsigned int width, unsigned int height,
> > > @@ -22,6 +24,12 @@ int vdoa_wait_for_completion(struct vdoa_ctx *ctx)=
;
> > >=20
> > >  #else
> > >=20
> > > +static inline struct vdoa_data *devm_vdoa_get(struct device *dev,
> > > +					      struct device *supplier)
> > > +{
> > > +	return NULL;
> > > +}
> > > +
> > >  static inline struct vdoa_ctx *vdoa_context_create(struct vdoa_data =
*vdoa)
> > >  {
> > >  	return NULL;
> > >=20
> > > base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
> >=20
>=20
>=20
> A device link would unbind CODA before VDOA.

That would be correct, I think. Without it, we suddenly have
unsupported formats when VDOA is unbound.

> However, coda_remove() does
> not drain open file handles, so their VDOA contexts can outlive that
> unbind. Those contexts still need the retained VDOA state and its lock;
> a devm mutex would be destroyed too early.
>=20
> Would it be reasonable to keep that lifetime handling, use guard() for
> locking, and destroy the mutex with the last VDOA reference in v2?

I don't think extending vdoa_data lifetime with reference counting is
the right solution.

vdoa_ctx lifetime is already controlled by the caller (coda), so
couldn't we just detach them from vdoa_data by clearing their vdoa_ctx-
>vdoa pointer on vdoa_remove()?

regards
Philipp
