Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21658F54
	for <imx@lists.linux.dev>; Fri, 31 Mar 2023 21:07:50 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id y19so14215572pgk.5
        for <imx@lists.linux.dev>; Fri, 31 Mar 2023 14:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680296870; x=1682888870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b3HBmEpRE2H5FpBYUp+3+9Ba8fJkZe2jGi9zQ9TL+bQ=;
        b=W789RceUy8yw1kmhSKR4L5nPOIoAT3j88Yf2vZLzGDSOKDFs8+WB3FKKBLvSNDsvpg
         5yBxh6cHNeNV4d9Co77o6M93ilUKffiHQQA5DGe5KaDB4ab/QkQON6uY1MwWcwJT49Lb
         SttW+5/pBvEal8cv5/iMRqbzAn6Os/yaxNIcdGhouK78bicF3ACG8XcMZd9ekA9V6ugt
         a+RfhCadtDECM9RUZigUSV0QLHClHF7DTypl5S/WCPa5DLOimseRYoBaTml98jUztxsR
         q/du97bxRyu9X4dLA3P2gUMVh/tdsGRxG4cW+Ajr8EJa8NoGbaI4XOoMNSLmOMyAlh82
         1/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680296870; x=1682888870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b3HBmEpRE2H5FpBYUp+3+9Ba8fJkZe2jGi9zQ9TL+bQ=;
        b=2EpADzZRFM2dywtwlp9fl0YEmMPgp/VABaxGFv058lYX4+ORK5vJ7+sXsvR6qBTaTL
         DbYHIYq6ZVpRnwcN/dYt1Lxze69gZGFEirkHh8gy+K+OJNFOa9kPWqCBXzwgwevBKnHI
         a9r4Yc7w1KI2vIhJ25hyn57yIm7OMiDM+gozA10P1IF6zC9pB50gTnBkIbr7R+ubC3cb
         9AumjKNKREea8QeK5R7gN+XMMufipEgYOiHL7Xq557Ws7NJji1zz3oap0NJGp+j62ut+
         hvRz1RID/AMevgkNe7aRf4zlK5XJzX+gx2A5ugFGkj3wGMlwSEl4g4m8fBMmx9y86AuZ
         jW9Q==
X-Gm-Message-State: AAQBX9eRNDYjMM6bssVPDWeMtO+CahhvIuHwKkTx8zAwxyGUQnlgV1YR
	txikvGlsFn9OLsRGs3uueKbjqKJGUsn5xoY9QfE=
X-Google-Smtp-Source: AKy350anRsfCLJkK+6go7iAS3sjtY50Uy4g6rt48MvbV6wCnxfGDtJ+/VnYLuDaAHD/e9L+vh5drPrTUww+Yab2/Nno=
X-Received: by 2002:a63:582:0:b0:513:a9b2:9612 with SMTP id
 124-20020a630582000000b00513a9b29612mr1935357pgf.6.1680296870327; Fri, 31 Mar
 2023 14:07:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230331205759.92309-1-shenwei.wang@nxp.com> <20230331205759.92309-2-shenwei.wang@nxp.com>
In-Reply-To: <20230331205759.92309-2-shenwei.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 31 Mar 2023 18:07:38 -0300
Message-ID: <CAOMZO5BwVWCMyiFG+HbjxeSvo+8x+1JtSmLmLmXWrWrsg6Cc7A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] net: stmmac: dwmac-imx: use platform specific
 reset for imx93 SoCs
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, 
	Wong Vee Khee <veekhee@apple.com>, Tan Tee Min <tee.min.tan@linux.intel.com>, 
	Revanth Kumar Uppala <ruppala@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, 
	Andrey Konovalov <andrey.konovalov@linaro.org>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shenwei,

On Fri, Mar 31, 2023 at 5:58=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.com>=
 wrote:
>
> The patch addresses an issue with the reset logic on the i.MX93 SoC, whic=
h
> requires configuration of the correct interface speed under RMII mode to
> complete the reset. The patch implements a fix_soc_reset function and use=
s
> it specifically for the i.MX93 SoCs.
>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-imx.c   | 29 ++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/ne=
t/ethernet/stmicro/stmmac/dwmac-imx.c
> index ac8580f501e2..3dfd13840535 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> @@ -19,9 +19,9 @@
>  #include <linux/pm_wakeirq.h>
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
> -#include <linux/stmmac.h>
>
>  #include "stmmac_platform.h"
> +#include "common.h"

These changes in the header seem to be unrelated.

Apart from that:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
