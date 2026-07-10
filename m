Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F1242B744
	for <imx@lists.linux.dev>; Fri, 10 Jul 2026 13:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688931; cv=pass; b=eltR3yjCa49cz1TPnQrFGkjJRMsWOiGn6TXt2FPdffKWUWX+NEDNLYQOxICymLiuDwwFeyc6rXsLDSK2oj/1HPfpSoaZ89pi++Fm5kPs0okD/5yqadzQhoDiqUYYsneUyQKzNRCBYR5uKOvjSd+qHQAp6QmOglUaHRmMSJZU2KQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688931; c=relaxed/simple;
	bh=ps29wYiABii6l1raYJPu8jGO+QY9Y08lyWKo6XlwVyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cHOPAukRjk600ewArPT+TkMwGC7nnlODqsgZn98Ti8QzebRlXsdt0CziXdhEx4q6iqR7BlNPg7vfgjmPdVQysESJyd8i76tX8FqEb5XGaDpWHdSat+9084V+l/udVc08+zF4So2UqHfTuGQQrsJnboRzshiL8qEwDUdAFgaCa/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PQbhMoe3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SHJ+HXfW; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PQbhMoe3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SHJ+HXfW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD7iux732754
	for <imx@lists.linux.dev>; Fri, 10 Jul 2026 13:08:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N5Cka933m4keuHC9q+ty9VLjOYV17gugYbjBnwJv6Bo=; b=PQbhMoe3PoBcb3Hs
	/DihV9aYD7N2odD9vazHqRjsDv89h5rZHGphaH+tpWhsa7+af5rBKTPuJdW8LPZn
	Mk39Wieqo6Mw60r42dLUd2Gxgi7p8bxjZpLshjrj7AzbL34A0DXvPUZmVUH4NX0g
	MgtJWs+BKx0AJ2Ezx5aSRboaeoiSWTe52rVeK8zpfzJ0RAwKpEqAfSYiOKp5qRRf
	EsdJxs0bExnyDS3qhxtop/v2dbSfVm0i9jaV/APL5yQgCnzY8s/Y1+SDeOsMMPGn
	F/+wgSzwHMID5UrcvHdiCAnKRs1pvv9gBeLt9XKdfGXLhg0wmyfSh8mZwn6Udt4N
	ZKZX0A==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf24vbg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 10 Jul 2026 13:08:48 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-6675e8ebb1aso1215748d50.3
        for <imx@lists.linux.dev>; Fri, 10 Jul 2026 06:08:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783688928; cv=none;
        d=google.com; s=arc-20260327;
        b=mmU5Y8q6gFmEThENm3id01kjmbi2nT6bVAnwHthVmAwJIYaO7ucwHtQd2gP1/x08eR
         bmvBAPyKlmpmyrfE4/1gTIJA1CeJg88WZKjLlCwJISkypE/HahG50d1X+JZpUrhLv/EN
         wMo5dQhdtJRxHjig42sP0LzoLBYJ4BWoF2suEUeZ4TNgNImwr2SCV8HoQwkuDKDa6ZWh
         ZgmlNYPUUIGR0lVYmJAP4OQGSx2W6WpdA46cauwLTPnxyw72CKOp7m+B6Lo1XPsRCyWj
         LTGDZZLHZiCBgag8hPqloz88qa/+SOmzoyRujQJopEeB30JJWOqMOpz9R29Dx6hXK3LU
         D9Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N5Cka933m4keuHC9q+ty9VLjOYV17gugYbjBnwJv6Bo=;
        fh=9Un5I3+SHidmspOhFL1niYysgozpSAuGWO7wWmIUohA=;
        b=NO7dRPetDKXZvjfuh9ONyehVpWlVMX3yScqqsvJo6iiXh++RcbWZf+o2hn0IO+GiT5
         oajGlsFzSUhVHnAdF/TExJzZbO/2d2WxpcJAl8MjBwdDHXJVpmns1yx/OPDmP2+hZCx3
         lupXjGFzb+7npXnXheL09dP/pPtJskXl/rFDxIvuM+dRJIvVanemF/gbWS92ouj7kgxd
         ycc6KOtPWys6roB2p0cW6UiKtXqWaO/jElUlXXImpF571HvH4Ayu30laPdtBLYEnuGex
         7tcVpSvkbS9+O8wps/wp//pKZhorbCiubesX68eUliPA8X+/S/LIMEjaJCZSPkmUHrAp
         3skg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783688928; x=1784293728; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N5Cka933m4keuHC9q+ty9VLjOYV17gugYbjBnwJv6Bo=;
        b=SHJ+HXfWL2xDazixoEnhEyAO079a3AvkQdRQPkA6Ascg4kcS92vV9EzkwQevjIhvSl
         IfS8JKrjcQblOkY5+0awYIYIhU093rj6LTSwlCd9FW/pyBMzQARDP6a2bTI7EP1LT9e/
         /SJYWGjfLerv6rqJxQQBUcBaP7cKwwQFxBWQn1Fu1TNwvhD0VKHMWv4PDNiIEoi9bP8D
         mQtc3miAEXop9pz6Md6uaveqQIHDMaRb+hMWZn2gK4B6JuGFSLi1Sot5Spw6fMttL1Q5
         kgxprkpYYRX2oh8WhPp8ldFuE2zfcQtOQ0yAPUKsM1mKvfpSa22cA1NSqU9Gyve0DS7C
         HCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783688928; x=1784293728;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N5Cka933m4keuHC9q+ty9VLjOYV17gugYbjBnwJv6Bo=;
        b=d7lqmkD+KgdDss/VGBc3ZqM2qOMHQFShfpPDeI/3yehK3goNryWfhQZGBex9kJWlFc
         roJo1bCx7a/4N/8yNuzRTsEZj3R5dus7WwLWvnZ0bmemcIA0k4y+svtd7sIfLHpkI7vw
         HQvL5ykao3xBB2TVK+TIPIdS9nd82Rq0V9AEIg9C2SLVxzIpdpsXJ2FEHImG/E6JZaXP
         qOrgxxTrvlz2g8nNbEyoUKRWOTxZrrvCgzmNTcXza1PiZabxIy6qb7AODE0V8tbYN8j3
         O5QaU//MN2aXyQI++VDWsHz+aW7ZZdKZEms5b30V0yL+uNtNqaRmM+PuqzhQN8nUr9Ob
         DffA==
X-Forwarded-Encrypted: i=1; AHgh+Rprp0YXHh/7ktBZlNSzRPQjJDerMlqSkvi7kkSZTxF2WYrxXruRwgCVmRIONGfhgTKjt80=@lists.linux.dev
X-Gm-Message-State: AOJu0YwrMBoeCNbY26asW/BYqjkHKvByQ6d4p9YPSEwMFt+ouHTBqGlY
	JALb046kgHfdCrbPIfd5T8hfZfXU7cUm9jg1q2PfNf78NVK6hkCtjHerm8yfNMYYEmsbeDa1PK3
	tW1Q1uo5EKMe/8v+EdlIl7jYdhDA+e104o7m/GLTGUt6OiTe99SbvMyWPWmtWjq7Podr9sv17L/
	5z5dBZ44Tm9Cnh/WlsVEUedJf8yUyZAg==
X-Gm-Gg: AfdE7ckumsllLPOaoXN9c4rZku+9RoV46ZnByrvzL5Sm66kLHuiz5UGIr3xZa3Pud9S
	AaCrAD/+tr2R5+RswMNPkU174vNsduz53yYpM7vtT9omhKQfv5zNpnhUv4xPAciHVgGbwPJBpAW
	zpr9v9AxNC1/X+FBHjiG1TRbHq994ZG4mLwiajaloiZtvTPmfBQ7NC1ck8G5JcYhcAWy0z
X-Received: by 2002:a53:bd08:0:b0:667:8b91:242d with SMTP id 956f58d0204a3-6679f245672mr5946040d50.92.1783688927303;
        Fri, 10 Jul 2026 06:08:47 -0700 (PDT)
X-Received: by 2002:a53:bd08:0:b0:667:8b91:242d with SMTP id
 956f58d0204a3-6679f245672mr5945969d50.92.1783688926691; Fri, 10 Jul 2026
 06:08:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com> <20260703193855.110619-24-mukesh.ojha@oss.qualcomm.com>
In-Reply-To: <20260703193855.110619-24-mukesh.ojha@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:08:34 +0200
X-Gm-Features: AVVi8CefhojPUiWasaXCCjZmJBb6K9Qzlv92c3u5BPoEMYadIduP2fyzpl9La3Q
Message-ID: <CAPx+jO-hkYQoEOj1Jrp7sn5HXYTDbfAG4U5rpNBW2Wue2TZxhQ@mail.gmail.com>
Subject: Re: [PATCH 23/42] mmc: sdhci-of-bst: Use devm_of_reserved_mem_device_init_by_idx()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ge Gordon <gordon.ge@bst.ai>, Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Peter Chen <peter.chen@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
        Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        kernel@collabora.com, linux-tegra@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        imx@lists.linux.dev, sound-open-firmware@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: nEmjAlIFn7npsykYPpO6VtAz0qYvt0iA
X-Proofpoint-ORIG-GUID: nEmjAlIFn7npsykYPpO6VtAz0qYvt0iA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzMCBTYWx0ZWRfX+Ld6Eu0qdKNt
 /uwkOaei6yg5FlVWu4u9Gzb1l8IAZST45bfdr2DDwwjiqyC2nVvYHRb95T4J127HvDp9eMjpmgw
 0WqPFlH99JCswHFnaxRVZAvcOlTx9nY=
X-Authority-Analysis: v=2.4 cv=daKwG3Xe c=1 sm=1 tr=0 ts=6a50eee0 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=z_eSG8vRrt57AjWXvbkA:9 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzMCBTYWx0ZWRfX3c/XoGsaJHKL
 P3147jrARmT2town0K4i3y6aPQ81tCUUBtilMMbMWrY5KvknaLn0IhMWYbBMiXOX3RquRTceykk
 WVX6jncWai1VAG4KOF4SPyy3/xFksTUYIjS4irYOhre0BQiEslV7O7/aOJEYXXaBYP5ZT+8JLoz
 bD5399Z35ZneRs5upHmXUYy1TMqUDwYCeVnC2L6LkhT3k4QsXdFPxJ7i7MoFNql9KRleKfp1ukB
 bUJPNZzmyTR1naMEYuIdMDE3AbAB9MGaWkbKAR2QrA2VwvnII6iac7Bx3F5VpWuL+vO5Ih/NFt0
 01U2Y4P1lAJVGskjn2UNg22GnZ2lHlRqfTAxvbV/tHEJUAelsi/eKfU5V49UiEC/Ngc5Vbaom4i
 DL05iFGWOPULhFjSJfJd1OeR9KJM3UHN15yNsW4bGhhkcZXmsZQ2172Y5tZMVP24erYzCvOWmWq
 kFnLlqs6ypzOB1Fdp9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100130

On Fri, Jul 3, 2026 at 9:48=E2=80=AFPM Mukesh Ojha <mukesh.ojha@oss.qualcom=
m.com> wrote:
>
> Use the devres-managed devm_of_reserved_mem_device_init_by_idx() instead
> of the manual of_reserved_mem_device_init_by_idx()/
> of_reserved_mem_device_release() pair, letting the device resource
> manager handle cleanup automatically.
>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Acked-by: Ulf Hansson <ulfh@kernel.org>

Kind regards
Uffe

> ---
>  drivers/mmc/host/sdhci-of-bst.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-of-bst.c b/drivers/mmc/host/sdhci-of-=
bst.c
> index f8d3df715e1a..304554ced690 100644
> --- a/drivers/mmc/host/sdhci-of-bst.c
> +++ b/drivers/mmc/host/sdhci-of-bst.c
> @@ -405,7 +405,6 @@ static void sdhci_bst_free_bounce_buffer(struct sdhci=
_host *host)
>                                   host->bounce_buffer, host->bounce_addr)=
;
>                 host->bounce_buffer =3D NULL;
>         }
> -       of_reserved_mem_device_release(mmc_dev(host->mmc));
>  }
>
>  static int sdhci_bst_alloc_bounce_buffer(struct sdhci_host *host)
> @@ -417,7 +416,7 @@ static int sdhci_bst_alloc_bounce_buffer(struct sdhci=
_host *host)
>         /* Fixed SRAM bounce size to 32KB: verified config under 32-bit D=
MA addressing limit */
>         bounce_size =3D SZ_32K;
>
> -       ret =3D of_reserved_mem_device_init_by_idx(mmc_dev(mmc), mmc_dev(=
mmc)->of_node, 0);
> +       ret =3D devm_of_reserved_mem_device_init_by_idx(mmc_dev(mmc), mmc=
_dev(mmc)->of_node, 0);
>         if (ret) {
>                 dev_err(mmc_dev(mmc), "Failed to initialize reserved memo=
ry\n");
>                 return ret;
> @@ -425,10 +424,8 @@ static int sdhci_bst_alloc_bounce_buffer(struct sdhc=
i_host *host)
>
>         host->bounce_buffer =3D dma_alloc_coherent(mmc_dev(mmc), bounce_s=
ize,
>                                                  &host->bounce_addr, GFP_=
KERNEL);
> -       if (!host->bounce_buffer) {
> -               of_reserved_mem_device_release(mmc_dev(mmc));
> +       if (!host->bounce_buffer)
>                 return -ENOMEM;
> -       }
>
>         host->bounce_buffer_size =3D bounce_size;
>
> --
> 2.53.0
>
