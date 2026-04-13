Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BA01C69D
	for <imx@lists.linux.dev>; Mon, 13 Apr 2026 01:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776044580; cv=pass; b=OvUAmsPI6nM2OjexFBBtVMsDXLzoZvYJdwuBXjXlmpK3rXy/Ya2ZSYeCrg97WW6uuqMAZbEH6jF/r911Fiy9Lbl34149zBgjlYnf0Lose7beh9v4P+EPcX0xhcbgOR02tzTxW+z1VC7gSWwl1K0ZRkY9bQEINGVbh6S5odUuxdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776044580; c=relaxed/simple;
	bh=qOI+HL01lOQlV/37/I6AGHvFI1YGoKNR8Wv08+v7GWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c05kKYyjT2Y3l3uhh39c/txFT8PLJO7mCpCuOlAWuBiQOaVFxq4Pxc/3PR3YSIhh+6le7F4mPdHM8Kbs5n8xu2+FaO2TrvG5/lGd1XnIpIJIYiR2jLSFbiz7wt08sehzNYmtovcK16S+mFq9rDRetA8ip+wrhk05Z3acLcppdTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q2jE3Jcy; arc=pass smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2jE3Jcy"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-42321c8b8f5so3154748fac.1
        for <imx@lists.linux.dev>; Sun, 12 Apr 2026 18:42:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776044578; cv=none;
        d=google.com; s=arc-20240605;
        b=YZQvpXXb/UE9EEGrHNjPGyD8CBVxkJlyXalWG/8CtcuJoAgF5QGTUH2+pOW0aJQkvO
         0PNHQLz1wOLCmGsaHrTwG3FzPomfDI757NS/cUAyA06VseJXhgHkOYs/sJ4Jj9myROOy
         CWVTX4sOWWGusuypnmMrYFFhE+Tr1wyYF0Gu74+k5BMsBCxtH1toOhNOie2dkWv1i6r7
         PFkgn6uJ3iMWb+hwZN0cF/S2tOAYjmvc7I8rFmSFQwBY9MSnViXaHeyeV3X/PYa05xUN
         EI1tRw7zFVSl+eXT3/j2g8g4rmV9mTLpObKRRVpfdtWy4Vks32U5oMlm5MmHM1FC1kxk
         vI8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZpqWZ5OeBihZW+KiOWj3yc4NCjFh45eEbq7S9GQ1ONE=;
        fh=+/GVtgXH4/0wCWSJJmuRnVVxdUvsnRO0eTC88r/rtKY=;
        b=EOTAi25Trv50y3aCCnFDwUhBkafrZcS7NyDV6m6Xy5xGGiBXXCfInPgedkqXSBqVxG
         Cdl6Abskz58DgdqLMB4Un6D8ZeOx246IVo2GnfLciWmbFmTzb0g/lVwLCZglFTj+KxLg
         Bg4b7n06VlxgTFr2fkuRoTXuzQhjxjEplbZYg0WojGemBjtik5BBbJ+lSio6v5qHAOqr
         9RxAzUu7JTZI/JIRs/jzZgaH7LC1zlwkhrViS994/mfbrxZPvYLJJMx7WczgdRThJ7ck
         E2A1/GjG1zZgq6vd1TBJCFDk13UI0IFXV5no4KMcHoZDJbB/5YttHeoLVeHZm7hztUWX
         9Y2w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776044578; x=1776649378; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZpqWZ5OeBihZW+KiOWj3yc4NCjFh45eEbq7S9GQ1ONE=;
        b=Q2jE3JcyiQg1Ul/8YRsWmMdmb52VCo4y6CPsU5g/J6BfuA5DT+Wv8FiqZuRUOLLvzb
         wlX5ODjS9zseRci8/N28jcXiUDCraOglOEgRN05hm/F5JtLsMwF6iWaHnM2qZRMeS40H
         SOLS0JWhotaVk31GAwd0uyLxMtq0eXTKcCWsgBa2hlrzWG9lfjkqIcZ9LVjTSHVCbTJD
         Noks4p1rTHkAAGoJ1NmqOxKmou/pCtrvbCyyopBogAHessszKMyqgBElSuGyV0d+LYUb
         swvJy/P0typDSBJv08AfaL9wphZVtErzxvvkbLib1PuHquD6krpeWumFBpCwSACrkcqm
         ce9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776044578; x=1776649378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZpqWZ5OeBihZW+KiOWj3yc4NCjFh45eEbq7S9GQ1ONE=;
        b=iqjj0t4Ig6myFBslw04InPnzKHJtqjnGYSFOkZvGCQ8r/KxwQ4y7VpdaD2tA3vDRNn
         vaaGIhH0Lxy7CPIcF7tcYhzS+3M/a6rbp9FVVHaYpl1ZEsacZu7xBcs2N4T3cZ2bfMxF
         pL0xOPDuA53vfP8F4jSsldHfD4pKS7a91vXmRWW1b5PbSKSd4P7RQRIpdLPCCn1FRyuN
         eYR2NpV2YfLXzAIyugXRvgRYXZXwbFtuvPUZnnh24iudJja7ssVKmzYMu/hBn/rw0eQr
         hAo+wpCAfoJxNgaO3DpKHPLUIVibEIwh/6NCBFNpfYx4hLhvl/Oz/JmK/1kKnDP+nFNi
         8B9g==
X-Forwarded-Encrypted: i=1; AFNElJ+c1ikAUSh0meZrPx6A+bPEl0halRW/O61ImQdzlacG7SPKTCUgj599wAbmpF+AwXIWruM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxlUxE4yFBQ1vklm/V7rq1Kdbbb52aCqHQzcAiOzTObVddKCI8a
	VruS+5uTUGb5QHA0Bu891BF/wq9tq4QbWAdq1Gc76chO/RySvLhpibRtkHXK2Y1kpFXK/BmsoVO
	8zpXyBXsybozD886Vce32Yt+X31LC5sY=
X-Gm-Gg: AeBDieugpKF4GgIYi1LVPlyUoGOCcTd2uw55AYBmsfrmqyjK1E/DhXsFLtnJZ6vqTdd
	dEy8yic3esZyeGLdWyLtVcM+lqDurv7NAPqMTAwsVqjTvivmUr8liE+blaS/l5FadEz+Uq1ApxJ
	QGqEJkDeFbWFJxUYRIVgdXcmQ/c1AL1SXTRuKUtyw8QEiB+dF4CLsjzYlXDGC8RkvOeH+apEPmw
	ChMbHHASw6oesf03nYfK2j1z/c/kslgVmgXRHYYtPtNEpoucdNsjlZB+5OIeJh5G7CX4PKOhUDQ
	QVYPoI6K
X-Received: by 2002:a05:687c:20c2:b0:41c:9797:d1e6 with SMTP id
 586e51a60fabf-423e1e1318dmr5077336fac.14.1776044577979; Sun, 12 Apr 2026
 18:42:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260410125105.39340-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260410125105.39340-2-wsa+renesas@sang-engineering.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 12 Apr 2026 20:42:46 -0500
X-Gm-Features: AQROBzD5VLydoqD-crkS8q5jKVQvu0Dgk3PHuV4kaQv0TPwaWMSf23DdaK7QoI0
Message-ID: <CABb+yY0QydFqBQ2sPzrbDjoj1ODTe0FW_p_4jyBR8cP_gxg9XQ@mail.gmail.com>
Subject: Re: [PATCH] mailbox: prefix new constants with MBOX_
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Peter Chen <peter.chen@cixtech.com>, 
	Fugang Duan <fugang.duan@cixtech.com>, 
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2026 at 7:51=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Commit 89e5d7d61600 ("mailbox: remove superfluous internal header")
> moved some constants to a public header but forgot to add a mailbox
> specific prefix. Add this now to prevent future collisions on a too
> generic naming.
>
> Link: https://sashiko.dev/#/patchset/20260327151112.5202-2-wsa%2Brenesas%=
40sang-engineering.com
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> This patch improves the above mentioned commit which already sits in
> -next. It is not really a fix but it probably is still a good idea to
> apply it before rc1 to avoid confusion.
>
>  drivers/mailbox/cix-mailbox.c      |  2 +-
>  drivers/mailbox/imx-mailbox.c      |  2 +-
>  drivers/mailbox/mailbox.c          | 22 +++++++++++-----------
>  drivers/mailbox/mtk-cmdq-mailbox.c |  2 +-
>  drivers/mailbox/omap-mailbox.c     |  2 +-
>  drivers/mailbox/tegra-hsp.c        |  2 +-
>  include/linux/mailbox_controller.h |  6 +++---
>  7 files changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/mailbox/cix-mailbox.c b/drivers/mailbox/cix-mailbox.=
c
> index 8cfaa91b75bd..43c76cdab24a 100644
> --- a/drivers/mailbox/cix-mailbox.c
> +++ b/drivers/mailbox/cix-mailbox.c
> @@ -413,7 +413,7 @@ static int cix_mbox_startup(struct mbox_chan *chan)
>         switch (cp->type) {
>         case CIX_MBOX_TYPE_DB:
>                 /* Overwrite txdone_method for DB channel */
> -               chan->txdone_method =3D TXDONE_BY_ACK;
> +               chan->txdone_method =3D MBOX_TXDONE_BY_ACK;
>                 fallthrough;
>         case CIX_MBOX_TYPE_REG:
>                 if (priv->dir =3D=3D CIX_MBOX_TX) {
> diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.=
c
> index 22331b579489..246a9a9e3952 100644
> --- a/drivers/mailbox/imx-mailbox.c
> +++ b/drivers/mailbox/imx-mailbox.c
> @@ -732,7 +732,7 @@ static struct mbox_chan * imx_mu_xlate(struct mbox_co=
ntroller *mbox,
>         p_chan =3D &mbox->chans[chan];
>
>         if (type =3D=3D IMX_MU_TYPE_TXDB_V2)
> -               p_chan->txdone_method =3D TXDONE_BY_ACK;
> +               p_chan->txdone_method =3D MBOX_TXDONE_BY_ACK;
>
>         return p_chan;
>  }
> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> index 138ffbcd4fde..30eafdf3a91e 100644
> --- a/drivers/mailbox/mailbox.c
> +++ b/drivers/mailbox/mailbox.c
> @@ -72,7 +72,7 @@ static void msg_submit(struct mbox_chan *chan)
>                 }
>         }
>
> -       if (!err && (chan->txdone_method & TXDONE_BY_POLL)) {
> +       if (!err && (chan->txdone_method & MBOX_TXDONE_BY_POLL)) {
>                 /* kick start the timer immediately to avoid delays */
>                 scoped_guard(spinlock_irqsave, &chan->mbox->poll_hrt_lock=
)
>                         hrtimer_start(&chan->mbox->poll_hrt, 0, HRTIMER_M=
ODE_REL);
> @@ -162,7 +162,7 @@ EXPORT_SYMBOL_GPL(mbox_chan_received_data);
>   */
>  void mbox_chan_txdone(struct mbox_chan *chan, int r)
>  {
> -       if (unlikely(!(chan->txdone_method & TXDONE_BY_IRQ))) {
> +       if (unlikely(!(chan->txdone_method & MBOX_TXDONE_BY_IRQ))) {
>                 dev_err(chan->mbox->dev,
>                        "Controller can't run the TX ticker\n");
>                 return;
> @@ -183,7 +183,7 @@ EXPORT_SYMBOL_GPL(mbox_chan_txdone);
>   */
>  void mbox_client_txdone(struct mbox_chan *chan, int r)
>  {
> -       if (unlikely(!(chan->txdone_method & TXDONE_BY_ACK))) {
> +       if (unlikely(!(chan->txdone_method & MBOX_TXDONE_BY_ACK))) {
>                 dev_err(chan->mbox->dev, "Client can't run the TX ticker\=
n");
>                 return;
>         }
> @@ -344,8 +344,8 @@ static int __mbox_bind_client(struct mbox_chan *chan,=
 struct mbox_client *cl)
>                 chan->cl =3D cl;
>                 init_completion(&chan->tx_complete);
>
> -               if (chan->txdone_method =3D=3D TXDONE_BY_POLL && cl->know=
s_txdone)
> -                       chan->txdone_method =3D TXDONE_BY_ACK;
> +               if (chan->txdone_method =3D=3D MBOX_TXDONE_BY_POLL && cl-=
>knows_txdone)
> +                       chan->txdone_method =3D MBOX_TXDONE_BY_ACK;
>         }
>
>         if (chan->mbox->ops->startup) {
> @@ -499,8 +499,8 @@ void mbox_free_channel(struct mbox_chan *chan)
>         scoped_guard(spinlock_irqsave, &chan->lock) {
>                 chan->cl =3D NULL;
>                 chan->active_req =3D MBOX_NO_MSG;
> -               if (chan->txdone_method =3D=3D TXDONE_BY_ACK)
> -                       chan->txdone_method =3D TXDONE_BY_POLL;
> +               if (chan->txdone_method =3D=3D MBOX_TXDONE_BY_ACK)
> +                       chan->txdone_method =3D MBOX_TXDONE_BY_POLL;
>         }
>
>         module_put(chan->mbox->dev->driver->owner);
> @@ -531,13 +531,13 @@ int mbox_controller_register(struct mbox_controller=
 *mbox)
>                 return -EINVAL;
>
>         if (mbox->txdone_irq)
> -               txdone =3D TXDONE_BY_IRQ;
> +               txdone =3D MBOX_TXDONE_BY_IRQ;
>         else if (mbox->txdone_poll)
> -               txdone =3D TXDONE_BY_POLL;
> +               txdone =3D MBOX_TXDONE_BY_POLL;
>         else /* It has to be ACK then */
> -               txdone =3D TXDONE_BY_ACK;
> +               txdone =3D MBOX_TXDONE_BY_ACK;
>
> -       if (txdone =3D=3D TXDONE_BY_POLL) {
> +       if (txdone =3D=3D MBOX_TXDONE_BY_POLL) {
>
>                 if (!mbox->ops->last_tx_done) {
>                         dev_err(mbox->dev, "last_tx_done method is absent=
\n");
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmd=
q-mailbox.c
> index 547a10a8fad3..e523c84b4808 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -728,7 +728,7 @@ static int cmdq_probe(struct platform_device *pdev)
>         cmdq->mbox.ops =3D &cmdq_mbox_chan_ops;
>         cmdq->mbox.of_xlate =3D cmdq_xlate;
>
> -       /* make use of TXDONE_BY_ACK */
> +       /* make use of MBOX_TXDONE_BY_ACK */
>         cmdq->mbox.txdone_irq =3D false;
>         cmdq->mbox.txdone_poll =3D false;
>
> diff --git a/drivers/mailbox/omap-mailbox.c b/drivers/mailbox/omap-mailbo=
x.c
> index 5772c6b9886a..535ca8020877 100644
> --- a/drivers/mailbox/omap-mailbox.c
> +++ b/drivers/mailbox/omap-mailbox.c
> @@ -238,7 +238,7 @@ static int omap_mbox_startup(struct omap_mbox *mbox)
>         }
>
>         if (mbox->send_no_irq)
> -               mbox->chan->txdone_method =3D TXDONE_BY_ACK;
> +               mbox->chan->txdone_method =3D MBOX_TXDONE_BY_ACK;
>
>         omap_mbox_enable_irq(mbox, IRQ_RX);
>
> diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
> index 7b1e1b83ea29..500fa77c7d53 100644
> --- a/drivers/mailbox/tegra-hsp.c
> +++ b/drivers/mailbox/tegra-hsp.c
> @@ -514,7 +514,7 @@ static int tegra_hsp_mailbox_startup(struct mbox_chan=
 *chan)
>         struct tegra_hsp *hsp =3D mb->channel.hsp;
>         unsigned long flags;
>
> -       chan->txdone_method =3D TXDONE_BY_IRQ;
> +       chan->txdone_method =3D MBOX_TXDONE_BY_IRQ;
>
>         /*
>          * Shared mailboxes start out as consumers by default. FULL and E=
MPTY
> diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_c=
ontroller.h
> index e3896b08f22e..a49ee687d4cf 100644
> --- a/include/linux/mailbox_controller.h
> +++ b/include/linux/mailbox_controller.h
> @@ -15,9 +15,9 @@ struct mbox_chan;
>  /* Sentinel value distinguishing "no active request" from "NULL message =
data" */
>  #define MBOX_NO_MSG    ((void *)-1)
>
> -#define TXDONE_BY_IRQ  BIT(0) /* controller has remote RTR irq */
> -#define TXDONE_BY_POLL BIT(1) /* controller can read status of last TX *=
/
> -#define TXDONE_BY_ACK  BIT(2) /* S/W ACK received by Client ticks the TX=
 */
> +#define MBOX_TXDONE_BY_IRQ     BIT(0) /* controller has remote RTR irq *=
/
> +#define MBOX_TXDONE_BY_POLL    BIT(1) /* controller can read status of l=
ast TX */
> +#define MBOX_TXDONE_BY_ACK     BIT(2) /* S/W ACK received by Client tick=
s the TX */
>
>  /**
>   * struct mbox_chan_ops - methods to control mailbox channels
> --
> 2.51.0
>
Applied to mailbox/for-next
Thanks
Jassi
