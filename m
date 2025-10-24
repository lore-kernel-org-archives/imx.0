Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E307D4F5E0
	for <imx@lists.linux.dev>; Fri, 24 Oct 2025 03:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761276993; cv=none; b=KHvCawYIagNiWX1+J0EzjDa58Wi6VwDBlVkURA2SpEHH3NvyuLsRijbK9JpxdXMtJdbr2EaTYe7egRrw4TWFv7tU2GRXirsRCRkx3vqWa4sy9i6VzhSAonOvl9lkjjVv8mkkj+iZxJwt0zK5I6wDb/TVZXt4YMTBoQgzCtoi2YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761276993; c=relaxed/simple;
	bh=BXg+mCHVidA9iZrXn9I516cQrbPXuicvfr+PM6FtK0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DdAanR8qeNkfMTaSwb17IG4t3TZxt4GBpjbS6q08qi1Iopgh4AYvzclywJHe/D98IEdXeqPRS6RklXQMJyU8oqw1f/GjZDTIZrg6iwb/mvkoNUh4TjIMdUETHa2G+ILJOTFpbxvhv2M5ruJSOAdzeBJ46AWdHyhEKuuTrX62pnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XIt2vIe8; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XIt2vIe8"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-33bcf228ee4so1521817a91.1
        for <imx@lists.linux.dev>; Thu, 23 Oct 2025 20:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761276991; x=1761881791; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LlN5DvyH2+GBtNgIhKU58Oi5/dzl5ldvweXQc1JJd8Y=;
        b=XIt2vIe8pe5nnChaOSJ/ho9Eo+o5EhpHGhkwh3wBByukJTMXMe0bupvMWMEwIFhrfv
         6e1bBVAIK2E+7d05fpXAmnatLsStLJxapNRgBxt658Z1ANsKTq/yUTf01MatCxrSeTie
         j6flW4+TSEuSzACurgepj1AEsZkOBqGMCHnud/+F4znpZfCQE8w6Z37rhVOoWcYiK0FB
         RJPR4D57UMHoBEahqLyE2qCXL1uuTMgddTcvqV1vmnsn2AvgDh7ciJeOlXuc776znYw9
         f3u8ZKaD+jknmpxwEnBcnGdAtCx5hCWwP2bnzghk6PGwUyn9XR0hN8CzPZ6qVsQ9/5vo
         on1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761276991; x=1761881791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LlN5DvyH2+GBtNgIhKU58Oi5/dzl5ldvweXQc1JJd8Y=;
        b=a/kr1YQj5NBovG87bpkyOqXhUhyXhEM6ZZiyVL1wmG5IHl31dcSc966pkpab+C2kjT
         KDK2tRrZaHTqFA4OXyBkKlEReoiRcnY8k3tDzN7BIOdD7BiqzjGFNsX5hECyqFeeL7Oe
         mBsLsK9HZhytrdhiJ6ghFyxX655fK7yBJ8NjQIvYPV/XJhfUp9NOP0Xm07bUDRntsoNw
         cXhxw109WqZIWwczX85w3qD/mPmpV84G+ouGwE98j8RjLlK7Sab8WYPjD0YIAiVOjmKg
         LgKX2D/Mvr3dfVw3JfFuR4ZHyfJW0+LBf2gkRsUQjwL2Q9TeviQvejCz+DsoMSJo8dw/
         E3Ow==
X-Forwarded-Encrypted: i=1; AJvYcCV0wRnsAr1AuYWrvtBST8nkj1yaZXl3Q2pSeX3JxnSILo5T4i/bAK9MuQDcmAIyXYYqjqA=@lists.linux.dev
X-Gm-Message-State: AOJu0YygYnBkiI/GgL6p9gOEqwY52MYQW3Kebtn3yDcVPW0Ji9FPDBCi
	D9C97Boy1Au/Jq1vDZ0j/WysKbvqjgAWVQ0p0GcxRPbeWfV6xoR+M/PMQT38RA5HAVD7Ly4PXsI
	jZ4zavkBgk0TfifHiulE20g/tvIHYdnE=
X-Gm-Gg: ASbGnctk2Du5tlZiOavYfXCPcYmseHuRCId9VBUybjTMH/QX3c4mZlQ9XKZ15aUebYx
	j/z8ZT2m0z895iwkSLeQCJXqp8Y6phk0d8s5N7RumyLLEesecpacaRvzjSRJZ/tkxDDwqWijMvo
	tgXOI2fX4yeSYLWwEgWchW/EtWuNE+0lmRNmfBecmTruq4fMv0V0LI2Eab8Xbvkehk5/UVl7I1o
	9xs09PmBzeMUeyU9qO3rNuIRQ4J6mYfbDxm6RkBnfuE7uVJk7gDV7wxVHhczL7ygtg6Upg=
X-Google-Smtp-Source: AGHT+IHmAjQXW6oneD0rQyql9NZfZkZxeQX5ygzBPkzltdafT4YRRH8XN5RuqvianxiGov8Gjv/rIG5Ew31uUO9ltuI=
X-Received: by 2002:a17:90a:e708:b0:330:7f80:bbd9 with SMTP id
 98e67ed59e1d1-33bcf9202abmr28546749a91.31.1761276991065; Thu, 23 Oct 2025
 20:36:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com> <20251017112025.11997-2-laurentiumihalcea111@gmail.com>
In-Reply-To: <20251017112025.11997-2-laurentiumihalcea111@gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 24 Oct 2025 11:36:19 +0800
X-Gm-Features: AS18NWAUWGWX5ZUSW4jhS3wlXEPW7gKSGrcNhdPOEUHBjtb-V-Oq2o2RBvRxgdE
Message-ID: <CAA+D8AN=Q7-b-SxfziJqsk1T-yNxw+VnOPAGsQhXh68e3UpN5w@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] reset: imx8mp-audiomix: Fix bad mask values
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2025 at 7:22=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> As per the i.MX8MP TRM, section 14.2 "AUDIO_BLK_CTRL", table 14.2.3.1.1
> "memory map", the definition of the EARC control register shows that the
> EARC controller software reset is controlled via bit 0, while the EARC PH=
Y
> software reset is controlled via bit 1.
>
> This means that the current definitions of IMX8MP_AUDIOMIX_EARC_RESET_MAS=
K
> and IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK are wrong since their values woul=
d
> imply that the EARC controller software reset is controlled via bit 1 and
> the EARC PHY software reset is controlled via bit 2. Fix them.
>
> Fixes: a83bc87cd30a ("reset: imx8mp-audiomix: Prepare the code for more r=
eset bits")
> Cc: stable@vger.kernel.org
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

best regards
shengjiu wang
> ---
>  drivers/reset/reset-imx8mp-audiomix.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-=
imx8mp-audiomix.c
> index 6b357adfe646..eceb37ff5dc5 100644
> --- a/drivers/reset/reset-imx8mp-audiomix.c
> +++ b/drivers/reset/reset-imx8mp-audiomix.c
> @@ -14,8 +14,8 @@
>  #include <linux/reset-controller.h>
>
>  #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET      0x200
> -#define IMX8MP_AUDIOMIX_EARC_RESET_MASK                BIT(1)
> -#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK    BIT(2)
> +#define IMX8MP_AUDIOMIX_EARC_RESET_MASK                BIT(0)
> +#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK    BIT(1)
>
>  #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET    0x108
>  #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK      BIT(5)
> --
> 2.43.0
>
>
