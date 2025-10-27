Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA4F2FF16D
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 12:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761567769; cv=none; b=AoYbV0Gsb2U6dVEDcFP68wzdzj/aF+xnSrQdzWfQZG+gSshC16CfV3CSMzSVWjaWDR8bZ0wwF9yXPjVIY9d51XVWtp3B4PNINOv/90/sabhDmwx5gvZSUzSrtt+TX6zw4wu01tPvKz3gSgQoPvc6UcqyIAcjogP9iqQHQVoOZik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761567769; c=relaxed/simple;
	bh=3muxG6MPxyrW/HfGoVTrDpf0zTKrmjAvX4xRLEsxaLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rEGdSnwm47aDAjbe8oLO7nqHctwVKfMzkRn9bPw4qJJk7lpJ7CdmkazCyBh6J3NbI1uwJDEK4UMRPAvhoTZ2Z4YaNq3QceV/ztj4lJHzkdTx5mXmuaft57jb1Olld7dte/TFn3lde8HLcD0FILWdXU2bgAZyzUZWYY/vcE4boRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hQQFjcNu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hQQFjcNu"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R84pg32232279
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 12:22:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JncXzot9W1gow8/tUDBTV3mA
	gpfqF8x82foGvNCR8u8=; b=hQQFjcNu2DH5Lw59o1W3SMNAFQY0QXjO/ktVuC40
	hzC7YzQhGKGkCh1lCcdb/C/niKl0YCCv4pxGe/CTro0PzN3sR8SCaf+bRb1G1SzN
	q+VuVqXq66xW1wvCMEun5HJ81BTKuCA3TxV612EXGGbQdvrskchdpi2h51F/OUc0
	NSqKEbYWk4av6IrCCZHgQNu/VoFWqFXK3rMMy9vmJNTSf4zHBpVxvjY5YwkyfErW
	3Ps46xiotXAIzJnryRT7QeUNOyGxvZKYB+by7tQ7mfvn5y+2l69ZVBj3vtenKmSR
	dxdsKS6jQdPufQELxCcW3VKJ+HXMXz8y5LsPIIwe11cxCQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a24wn8qen-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 12:22:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ecf72a45f5so38793161cf.2
        for <imx@lists.linux.dev>; Mon, 27 Oct 2025 05:22:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761567766; x=1762172566;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JncXzot9W1gow8/tUDBTV3mAgpfqF8x82foGvNCR8u8=;
        b=B0LBs8a34XhZNBu55Mt2WU/3N2E19Ha7hEBeGtq+p5xf5fbUNZEJmkttpV7wr3fxtb
         9DKuSwi2R6AxBGxMufVqcH+7vsTNXeRhfvItlpGYgE2uqa8DBvnXiHjxQVAIpqgZ+CWO
         YJ6v5glaHMeM+YLQa3/dyX22T6MCuM/ZDhFMH6aN5YcOjiUKavZY8A+2bT4ImQ1F7QAg
         Z7IBdpSn6DQdiEehkf0o/seeG3ha/XOzWJ+jODTKzQVj9IjYlbp/1aRt1u73uhETuh3b
         xnQy/YL2kgJbqXyySZl4piO09K5VyHT5HsrRzDtNeXUoBc5+R81ICZYrBBPkDTIwAzhW
         IKPQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0iEblE7tM6HfUaOW4IJj47jFnCdOt8L615wJh3xgdQLFONLKknQTSWoIPxGsj5tqLZyM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzMhR2lAf3p2PmclghklAlV4ro8oqA/xC8TCgROS1n95qZjdTHk
	nOFi7UzwsQLhI/p+dKRt0/iSxr125hcLgXGeF7wGwoA3ouLhZRKxZ0UbmPBbpT8+PiTonuol1AL
	xwm5dni333SBqY6KK5q8ViTPtjzng5u7q6Q8wdSXlexMeOdKIkwxqY+Q=
X-Gm-Gg: ASbGnctRnjQ068mWOUyqRi6lG+880aVompIiEd77P/WXlhog9DrNtswDHDmH4kM8eU6
	snTy9a5o5Um2MjG8zXh59q5Psw1B68b1Z3LPf0A03EBSOR9Ntr25vTiV4YK2Ts1w4kmUfE+La1J
	8ezrE7qxD0/fo59TsxDjKdJpsRg/IJdLkWjVYVwdftZfxf42a3xgQ5nyn0WI8xWVO9uXL3okg+s
	nIbdQQnwCz5NiNq66TiyREj/Se7GIon5XsdBpyo2/mqHF9wdNpSH5lAl5IY1yTM41QiusZw6SuI
	pZI97Ysz13RXTSA1LrOBOfr3ck8Lf2MeLf2XgtCXrEnSdjFMYsISGpWTJqN9ow/eZBTaXDowIfQ
	94yNUrFzJt9dIq4aa9dIzt+jAjekCpiUFx/uTUGcy65V0BzTZT91af/6Ot5kNNRI2pA1H/34Kv8
	+r2kqFiPKjUSr2
X-Received: by 2002:a05:622a:353:b0:4e8:9f87:1f42 with SMTP id d75a77b69052e-4eb94922adcmr152956021cf.69.1761567766312;
        Mon, 27 Oct 2025 05:22:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH79d7Do90KoVZ1tYBoBY55fSIjzc3SaetN68K8JqBrkVyDzQwzXI4DnjU4YyJIchWS9APnNA==
X-Received: by 2002:a05:622a:353:b0:4e8:9f87:1f42 with SMTP id d75a77b69052e-4eb94922adcmr152954761cf.69.1761567765265;
        Mon, 27 Oct 2025 05:22:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee0e0246sm19655221fa.49.2025.10.27.05.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 05:22:44 -0700 (PDT)
Date: Mon, 27 Oct 2025 14:22:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: netdev@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Wei Fang <wei.fang@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Paul Barker <paul@pbarker.dev>,
        Siddharth Vadapalli <s-vadapalli@ti.com>,
        Roger Quadros <rogerq@kernel.org>, Alex Elder <elder@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>,
        Liu Haijun <haijun.liu@mediatek.com>,
        Ricardo Martinez <ricardo.martinez@linux.intel.com>,
        "Dr. David Alan Gilbert" <linux@treblig.org>,
        Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
        Michael Nemanov <michael.nemanov@ti.com>,
        Kalle Valo <kvalo@kernel.org>, Andreas Kemnade <andreas@kemnade.info>,
        Roopni Devanathan <quic_rdevanat@quicinc.com>,
        Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-wireless@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND 2/4] net: ipa: Remove redundant
 pm_runtime_mark_last_busy() calls
Message-ID: <g4ryfonkdpnsgqo4brx2dymo7o35jkndc5kkhdybhyvwo5rust@jwsivdbievvi>
References: <20251027115022.390997-1-sakari.ailus@linux.intel.com>
 <20251027115022.390997-2-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027115022.390997-2-sakari.ailus@linux.intel.com>
X-Authority-Analysis: v=2.4 cv=XIY9iAhE c=1 sm=1 tr=0 ts=68ff6417 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=QXDDecBx9f-8Df5VMo8A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: EcNOe36srfTJaGJPVP5Sc50lAvJS3uC-
X-Proofpoint-ORIG-GUID: EcNOe36srfTJaGJPVP5Sc50lAvJS3uC-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDExNSBTYWx0ZWRfXyNwM4QhOmueP
 SyfNSSPQqEhON12ryxPL77Jl/w929wlGp+HPXZ6oe71jae8ECL06q/K8AmPSD+CwTiM/Zg0UeBq
 kOOcVa8flg0jIRngMux4uTvU0dk0UKJ+cbzU6M7P9UrE+RM8PjNINbMt6tNqgdf+JvVC3/PPch8
 Zo547iCnN03hxL/4mOLfvoabY3Nmu1DOl4BUPIy26zQlXwXPvQPj3ww5lXTWEArzr0pJdMvXRfh
 XMoa+CS22fm28C9Jz4UQf9eYYp1KzQ6zwwR/X+BZ0pKUSHP1gV7fDjZVkwl85UVK3nbsC01xGMa
 vUiHdk5PdYZv/wOFyvaTArPL7mTofqs5pW54MxxtRyjKk379objEqhYtNq0ZFBJ3oHqrDf+S1ng
 0pwCEKa6dICiGYHdw9dNVS+mK5QQEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270115

On Mon, Oct 27, 2025 at 01:50:20PM +0200, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/net/ipa/ipa_interrupt.c | 1 -
>  drivers/net/ipa/ipa_main.c      | 1 -
>  drivers/net/ipa/ipa_modem.c     | 4 ----
>  drivers/net/ipa/ipa_smp2p.c     | 2 --
>  drivers/net/ipa/ipa_uc.c        | 2 --
>  5 files changed, 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
