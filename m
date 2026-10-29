Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793276029;
	b=OO3epFsV6qGiDi2Xniha2nGH9kMeF3ZO0NeSRpbGc5fGhvyT9sSR1WAtZzXRRnsOPb/A
	 crY+CdA8jlmSYcmkAbxCi7UXcytEB//ukYdGCJvkVmpKwVWrlgI+55GQaNDsVRyMhMjgp
	 9MS/pcPQVPYZWf6OEZYKdQfeID0vBYNCgRV2hsSs5tbf8fDx1PDqmBxrc13eCDA2p/8NO
	 6UXIzpNylldQEr5x8OY2bc+rgt+vuMECFVS5wqvAj0ISIay4Mq/hECk1SdOg9edTei15e
	 ntO3/yfvPOMC79iOAyqKHmqV/rj3fI+fIeMt5l+bnztIlB44ZZLm/skmkuRA2GsfIlA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793276029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=r256phbedMQpLM7Pol3bN39JG8XwqfFdaxgjo+KREnw=;
	b=N7K5pOfDLym+2X+rVAAicrSXNUNHiJzLwVRjmG/JOC7GmyqL8/SsrsEui/Cgg16H7/RZ
	 YwwyMm2jHBBmufEV/tPwH450FfjT+AuStZ7YaMGakwtvMwlcG5JO+3WOV97SFHE6OebsA
	 tIHsgig8uqvndDR3ahmKl4RSDTu8mTJmvs03aFFp/TF5XISafOU3mIGrpPBjtIy7wzAaA
	 PSBYwttkpMdJX6FvrR/VgH3h9ShMWLec6LukP/Ksf6UlNTDifsL8lCpAb5cAtMHHK0YqI
	 bI/3PriIMimyCtDhADGVd1KuwUkQw6H6EpBI8gpOLoOZhhCIYNRC9sd3jxPBgrSDW3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D+oWGqs7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150D1606A31C
	for <imx@lists.linux.dev>; Thu, 29 Oct 2026 12:13:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 150D1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D+oWGqs7
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5be47aa555cso2385616e87.3
        for <imx@lists.linux.dev>; Thu, 29 Oct 2026 05:13:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793276027; cv=none;
        d=google.com; s=arc-20260327;
        b=kHv2S+o6/OpMSbPHa7AURf+JWfA5dXwJIhOG+iqLfJ0rdPLnSde/veafd/MSQYp8Bk
         cpGhdsDi8dPZP2hIym234tdBojM0a3JXvc/BznwnOrdeNTho9dMHUpIhj7UuJEFhtPoB
         6q1EM49gBwzyaECQxMGF8Mr9qZywdGAYrnyOWSS/Y5xgSjkKCP6aPDm1zwOanRrSJiRV
         yxfkfRKgtqzmnwENKYgNe2M4Kcweq+xTqfIAU868uWRaGJ9TiSYuO30nwPcOWgXce/4i
         n+Y22h/4b8r+rXQhDvFhlJqrOXQK9eZefryolZNTU14A4U4RmcTtuM0iI2WyvWMwuk+S
         QM+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r256phbedMQpLM7Pol3bN39JG8XwqfFdaxgjo+KREnw=;
        fh=+I6IAn92szHDj0js2KdxJQ8Q+/gn5LSIxJxYYtEc5So=;
        b=mAxntjG7mbpE+cPIWAA7gW5V/0IKYd/OeDjLUe4eXblFV9RipktM2+re1DfVx8rlwA
         HNFdG+oW85v4mEnSu2Bk0JQ5Jt9KDYqtFGvNXigsiDl9UbBx5A+ZASP1ox15kMEguwWt
         F7irjNgWcAXgJ0YJcDBKHoS9SjtTat7K/y85cpN86NrkTNiX9bS864a59RMNy+nJ8QR/
         3tchz65t1dIv2m8oZnahA+91IgxcgcTu/NjkYtfziTgN4cmvo60RMUCUmp2/9UMklsjK
         +5gcTB7MsvNA+zcXjvRxDt+qqzwVvqr9yZzbzJGMu1LOiNwntBdRwNSf/pgTeusoftE0
         MGgw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793276027; x=1793880827; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r256phbedMQpLM7Pol3bN39JG8XwqfFdaxgjo+KREnw=;
        b=D+oWGqs7rXJc2cxG41NYBRbOsYVuJQuILvZpFDpLz+PRDszvCxwFDaY96el8qgLBfs
         FuHrtj7542rBiuH7MEX/g7RvThLBrIZWpRuEc20pNKFQpYJp2cM+UnE46MakWnn1/Zvc
         JEmKcQgqlof14fYm7s00N6dXRkDGAaiE6j1wU6Q8z1ulS2cWCifvhMj6n9gpWhVKCGUu
         X3TE8rPtgFb5SWdBzWFKcQ9/ms9SfhZpoig1dQqxuzXWWSAxLtj0lr7nQzofCLFK5RBH
         TWdnx3l3i5mRNY5MFeeSLD7tUWFcXWgmaEB1CVcPoupUUTfmKcL/w3C0+I971KGDc1Qi
         addg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793276027; x=1793880827;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r256phbedMQpLM7Pol3bN39JG8XwqfFdaxgjo+KREnw=;
        b=i3gyK83UN9hx5/GXVLlSeQAGv+pmXtn+Ul3tgybtl2sHcD6c3xQ/CV3koNnCMs8KpB
         jtQDC2oP/ChEwD8P/MuS4QN9sfIuetwpgdiUkqNf3f62UjXH4vWDmqKBR5XZtzfMv6d/
         K9qOTq2ccPjqu+KpvinWqVxYABi7pWGGNonc9SIL3t1UfaeQSJFoodBbAdY+UeXMhkDg
         pOLeHVNcMJaAhpNueFZQ5L59dc5fi7/pq/jxkGW11mCdgF659o87Es4Rlh93LRbVNAst
         KHm7zYCFqOFx85vedxDnaD8xeWBlgHdxLGtbkM92sgs0KYzLcEz5rpvG/Xf+1RBAdbl2
         Zszw==
X-Forwarded-Encrypted: i=1; AKwUvByJObluP+z9Ifej5wLtr7yfHdkpSBkFpn0i7bMgB+i2dCoYinAARGCZRnZ4aIieQ00DsxY=@lists.linux.dev
X-Gm-Message-State: AFq9FYJOCCpHMPloMSP5ibOqwF1INIk0Wwnk6AJJIJQL4m6G5JpbWPmA
	VlnwKyPetG1/cZAjCso3Qhqlp53XHCNwpuQrFdUfPjyCOCTT7XYkt2ZEOkN4LQphZunLaeTGolz
	a57jDXToImgZ4tO7qZe6TjUFHFWULNe0=
X-Gm-Gg: AYBFou14cb+E3FaCmkyd5uuiNXNyFBZO8kY+14BqoNqZZ9DU/gm8VtsJMD3YbpTFquD
	uWsorTh2sMc6/p2M0Gmi6c5MyuRas+uz+NRDL04kbRfCt2MytdFAB4SuYeor5q7YkuoBPv3hkcw
	h8W6mUGxi3QbiKT1+K55AxPjDdpO+bav/bRmK33ag2lX6ePhV8mrsJbuTscvq0xT3ImRgwfnn/S
	iB32INckHAjbP+C46exj/+jeErWLZG7NyMNEgirRVS/89aiRoBY89B8w7Y70sbaFCG4UUq0tDKj
	IBcLuBShHEBsEqT1UWi8P/ogQ2JybLaF9o7tGnhYFnP/zkEiiIk6WSByu7bczcvWJjHWnv++94W
	X5gV74bHATjVFpHgi5pCun1opCaQuUHcmkX/9TXggIJwxoYzj61/QqVy+AinHt/smJfiY9w0Yld
	oiOO3o4paRsn0Ey41JbMdMCWE=
X-Received: by 2002:a05:6512:3d86:b0:5bf:b5a1:3c09 with SMTP id
 2adb3069b0e04-5bfcaddbde4mr1985707e87.31.1793276026925; Thu, 29 Oct 2026
 05:13:46 -0700 (PDT)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-0-aad7a6b3c62e@gmail.com>
 <20261027-submit-mtk-uart-dma-synchronize-v1-v3-1-aad7a6b3c62e@gmail.com>
In-Reply-To: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-1-aad7a6b3c62e@gmail.com>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Thu, 29 Oct 2026 20:13:08 +0800
X-Gm-Features: AclHuK_9NKjNXktxauulycDv6ofwBJPad2Bl9GVrdKZysKXzXdts0yEdkZdQ85I
Message-ID: <CAJhJPsVQjajTzOwXyqUkdTT+Cw8wEX7-0NOS63S9cByvDSYLng@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dmaengine: virt-dma: share the DMAengine
 synchronization callback
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Longfang Liu <liulongfang@huawei.com>, Andy Shevchenko <andy@kernel.org>, 
	Binbin Zhou <zhoubinbin@loongson.cn>, Taichi Sugaya <sugaya.taichi@socionext.com>, 
	Takao Orito <orito.takao@socionext.com>, 
	=?UTF-8?Q?Am=C3=A9lie_Delaunay?= <amelie.delaunay@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Frank Li <Frank.li@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 2:43=E2=80=AFAM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> Several virt-dma drivers implement device_synchronize with a wrapper that
> only converts the DMA channel and calls vchan_synchronize(). Provide
> vchan_dma_synchronize() with the DMAengine callback signature so these
> drivers can assign it directly.
>
> Document the requirement to stop the channel and prevent new callbacks
> before synchronization, and the context in which the callback wait may
> run. Replace the equivalent wrappers in the existing drivers with the
> shared helper, preserving their callback-wait and descriptor-cleanup
> behavior.
>
> Suggested-by: Frank Li <Frank.li@oss.nxp.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ...
>  drivers/dma/loongson/loongson1-apb-dma.c       |  7 +------

Reviewed-by: Keguang Zhang <keguang.zhang@gmail.com> # loongson1, virt-dma

--=20
Best regards,

Keguang Zhang
