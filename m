Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8D4156C6A
	for <imx@lists.linux.dev>; Tue,  5 May 2026 15:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777995892; cv=pass; b=PKjgoYe8edQYrJlDMZx7ycoHuAEzGtfRImdTvh8QbZSloh1rGNfQ/9z2lxRfJmgIvWKuDYJy2K197JxmhIo2Xgy4brKOGu4MCejRFoJk0eJQ24kh6n/4a17HvXA5ETtniWCUDS4XVw2vDa+xKElfugQQcIVpwUnBY410gjKL1kM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777995892; c=relaxed/simple;
	bh=/F5bUrQOL6qjXqnNv8WEGRzaHmX1VWR0LG4ALaOjTpc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LRKm575bR0Yvfp6OG0zlFa+cDG+xVVzGJQKiAWDJxEsrhpHz1wPvPqqCQlA6zzG0dHlvaGhNZTpMtc5PNDgiEYL/0PZL5eXMYtr61NFuSd4OlbGJJy9kPgNbpkBPvKFJWJm+7N0gwuhreT1Etya3wcOxjFcsKbui9TacOC19638=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FSXkUZ79; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZDuT+ide; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FSXkUZ79";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZDuT+ide"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645B6k6q3091762
	for <imx@lists.linux.dev>; Tue, 5 May 2026 15:44:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wHtuKQwh8UstxhITdsUE78yY+LEnRMi9wxCxBnmC8jc=; b=FSXkUZ79BlApOINR
	af/MGmqQz++xr1KBSQFO1BQOhnKliuSWZGl3ECMY5fzC/ff8iqW2j8yTBQZ8qeIu
	yXJAGiE0zqmaYpx22VYaysHfRBsN61UJwzaX7lmU3aX8F0uUitTJJLX8msJVywIR
	8Zx/7+Ms/92vF8NFmM2E42NtDwcLRHzSy4X3K9kJlBdK/OOXWJrQ/IEozTnuQbIu
	dUTRA+1QmFO0APH0CmPfBjpTLNEQmQktkpxVDzMAyCxoQakk1LSnvi3LakHHou2H
	0jCZqc382wr4rLRbONa/otcXqt90r1m0/cgLoVi5lRIRpUiSBJChqzOBOdPjSuZb
	ZXQrXw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyfct11f9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 05 May 2026 15:44:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d6bf346adso93398261cf.1
        for <imx@lists.linux.dev>; Tue, 05 May 2026 08:44:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777995889; cv=none;
        d=google.com; s=arc-20240605;
        b=DWsSIE3kEOccZ+04BWU36GFsj0+tWM8crmKVSiHZ8uzvAP6dFmCl8ltQxxLwVP5EtZ
         /zeFJs3RA3RyXALaOSMjn7VOT9L7bOJW13yZR+uekm9XwhLyWmJnLVFVw29Avylt42t3
         Lx9FU/9xwZ2KrIplv+JFTtwy6xPx/CvkN6KoDd+l5YB31Tk0Bmcbj3h5fCxPlYahoJ2L
         GcBDwv+gwWBF2pu8tSw71qv/b8U9TcyX83JJ/KKnQkOvanNyNxbfLNStDDeiDWjviW7u
         UvYg6ilVXm2AJ/zk+ko8xyOA4Hr0AsLNCHS9SplX5G4nJTF/QOMAGiswQn6Xw2XqR2GV
         GDmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wHtuKQwh8UstxhITdsUE78yY+LEnRMi9wxCxBnmC8jc=;
        fh=/gq4R3a9aLzImIy+QbFjmS345my7VWyfKg/bC3ERgbU=;
        b=cnH4R2FB7Lf1bOtAezcoG+JMxzLYFcWQMl0+VYFtGh9k1BT0iD+h6EGpYSFcBS9Usn
         u48EJSfN6BO3wuXSvkvPo2jA+ibydVTqlncZkVA5XpZOocXfBKqKyD0vlRI3oEDk+cUF
         L9dBJLbWyQA3HmmgP1j51reKE2+6zc6+C1BfxXEnJCgUdAxD6UJMd/mIhlGwTUGVMhtM
         SbTJFUeho8nSnOik6CPPEMzKGl4PS/7R8WgHd/5Ve7WjO6dkPz6D9YXMyylqpkr++4hP
         raPndt3Ogcfep7GMTKy89KQHsmtMLYDunqyisXqrJP8Kjc8EobVoDzoiQEnoxKV+iGL0
         tbmQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777995889; x=1778600689; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHtuKQwh8UstxhITdsUE78yY+LEnRMi9wxCxBnmC8jc=;
        b=ZDuT+ideCiBPCbSbmcMRAkQlCtTn1fY5Fn+gSBjmysT8RICYSE7cEQLo/4UySbrNo7
         QY2bKkW0zVmvXwK5eS3ucdk3Qe1xdq5NRnd1uZqxya6KF3Hbcvl9Wb/rlMSYrn/6L8jS
         myGOKfEpatFvXVbhe69kwuJW4o7u/kon9aX055eIvGXbRpwbRfDEJhdZRQnuVyA7XuPM
         4i8ZQwx2HCaBsMpfm/9fF7Slsf/bPowYGyZjTdi+ADGxEVVFg4X5I7DZcuWYZCkHXyqB
         p4Elf5S8eG/V3VEJNNPS22aAFTkHP2PW8j8BzAsID+aD+lSGGeteWFZVDVltiR1Pldos
         ll5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777995889; x=1778600689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wHtuKQwh8UstxhITdsUE78yY+LEnRMi9wxCxBnmC8jc=;
        b=LsCSM0cqB9/9VBMLcng4Fg2dkAIEidn0GPguxsrBve2zd2TVFrcoPlxL3lZeRWX2yP
         5ipPYR1sx/R1JR2qq9881acaKSNb7L4GIYQ9LQq+BaxXvI7J9qj1/3Y+1dtvX+pPUdAy
         PBRHRcr8bFA6p+6lf+wJ0J0f+5w5FBWsmfExJ1FDH7aJ25Hl4FCGGvD+3NRq2uJmvn1y
         OB8suwgujF/qSR5lFp8h0TkovXmda9S4kd2bbseTj1IvLnZ4cdwztLBnrNGbjB9utCBA
         4NeNnlGnGaCs27hhOpJbzd5485qt23brDfcdyASvUhiTWN8YGFYm0p8XHniSkqLLkI8u
         QJ2g==
X-Forwarded-Encrypted: i=1; AFNElJ8chHhRLjzPVl7KE7BUmhBctS+HJOxCf8jmDQXYpV41OnNs+h9/9up/kK+G6D0vwZKQHyM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyMuWrc24YX66xC5KzcXq56ctC6vg+3eb+FLLyufNKNaHz76Qyx
	ynoYDiGT91IERAER0VVMHl5i0y/7GxWJe45XSQKCtPjD2DCntD+fXwFbqjl3vXDujUxZi4bPGjI
	Lk1eCkWbj1rcYXNB53/eBYfiZCrmNDDpBTOvnswkgQnsbSaARi2XI2LP/IGO6RVcMYFP9+/IF62
	hFRmG/44mxPLXprZnX4ifdyS0xraaZjg==
X-Gm-Gg: AeBDieu7IgVn6rlT/L2KhkOizszJpFspLpxaSynDTvyEC0/u2XJzbzU2eMRWvqHuWPL
	5NMa8hQy+v05S1hW4Q4EIQ6aNV1dIVH+g6U47x/5YHPkfXT5g9DoSvrIyVyeGB46SgecZJCbRty
	nqJ/DOYkFCuiK7T+osic5UFLPdWq5W4THEoJ19Q1sTF77AWfgLS8SmUr3svZyWoJE0LLsEYmKB/
	Ba0BuFmzied7rP5iYfHJDGjvggDzezIjzdTQ8SOO/VEdTv4f/A=
X-Received: by 2002:a05:622a:903:b0:50d:9174:cf33 with SMTP id d75a77b69052e-5104be18800mr207044191cf.16.1777995889118;
        Tue, 05 May 2026 08:44:49 -0700 (PDT)
X-Received: by 2002:a05:622a:903:b0:50d:9174:cf33 with SMTP id
 d75a77b69052e-5104be18800mr207042311cf.16.1777995887526; Tue, 05 May 2026
 08:44:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260430132140.30369-1-r.mereu.kernel@arduino.cc> <20260430132140.30369-3-r.mereu.kernel@arduino.cc>
In-Reply-To: <20260430132140.30369-3-r.mereu.kernel@arduino.cc>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 5 May 2026 17:44:36 +0200
X-Gm-Features: AVHnY4IJCC3ds5r3VsgLF9k8vq5o94dTl-X7DpRfJfmTcyAIRiLE7IATJGnRpPg
Message-ID: <CAFEp6-31LQX+uHJ2PFES76RGqmZKS43dO3UoziVZ-KWQGCy6aQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: qcom: imola: Move analogix video/audio output
 to dtso
To: Riccardo Mereu <r.mereu.kernel@arduino.cc>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, broonie@kernel.org,
        linux@roeck-us.net, Jonathan.Cameron@huawei.com, wenswang@yeah.net,
        naresh.solanki@9elements.com, michal.simek@amd.com, nuno.sa@analog.com,
        chou.cosmo@gmail.com, grantpeltier93@gmail.com, eajames@linux.ibm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, festevam@gmail.com, imx@lists.linux.dev,
        m.facchin@arduino.cc, dmitry.baryshkov@oss.qualcomm.com,
        Riccardo Mereu <r.mereu@arduino.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: B7ckX6xXUa7459bkaRGGDyNFXo5-vJzJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE1MSBTYWx0ZWRfXx/F8B2uBuXwB
 GHH9T2cXN0Nkc2U06YB65M9UjZRQ1jZqTn+wNI6MLRqo8s4wzLc7HtY28Qn2r1vBtY1ZWNKao2b
 ML2kULrXlAp/i1oe438Nip8Wb4bhaOmKrcmJvRJUsnLRzbpdyT6DL8FyeP5iKv8clBy8506bDeU
 627TVAmFvmE2rGyp536bvsVfHiHGdWQZ41CXKLvO+xTGk8OmqqdCXrrcP8vAyMNtyaPspF0oYqr
 DtWq9m6fp0xHjqh6NuqyimLrkfbT5G+X31epq93rBuhK9mKezybi+QIX63mxYU/udmXKZEvwOHi
 L22BLbPfht2IpzR2KqxkUgmO0fWQQDZ/nOWOBv+ScFM5UgbuaE2gZ3jAbsMLQ6mTpuwWd0HKx73
 l9K0/iDt9FjvvKJO+loms70/c0kqiIxcBxQD2lSY8jajV555gXDSSTR7mG66tDChxe1l2YUP/kR
 9tYgksIhIUZnPSjWoQQ==
X-Proofpoint-ORIG-GUID: B7ckX6xXUa7459bkaRGGDyNFXo5-vJzJ
X-Authority-Analysis: v=2.4 cv=NtXhtcdJ c=1 sm=1 tr=0 ts=69fa1072 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=uNWQtxkOhitwP4Q5j2cA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 bulkscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050151

On Thu, Apr 30, 2026 at 3:21=E2=80=AFPM Riccardo Mereu
<r.mereu.kernel@arduino.cc> wrote:
>
> From: Riccardo Mereu <r.mereu@arduino.cc>
>
> This is done in order to support different video output over DSI.
> Since audio part is linked to Analogix USB-C controller it is moved to
> the same DTSO.

I'm a bit skeptical about having a separate DT overlay for this. Is
that really the right approach? The Analogix block is part of the main
board, so it feels like it should be the default video/audio output
defined directly in the board DTS, rather than in an overlay.

Would it make things unnecessarily complex if we instead keep it in
the main DTS, and only use overlays to remove or override properties
for the specific cases that require different routing (e.g.
media-carrier or waveshare)?

Regards,
Loic


>
> Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   5 +
>  ...ola.dts =3D> qrb2210-arduino-imola-base.dts} | 122 +++++++++++++++---
>  ...rb2210-arduino-imola-video_sound-usbc.dtso |  61 +++++++++
>  3 files changed, 168 insertions(+), 20 deletions(-)
>  rename arch/arm64/boot/dts/qcom/{qrb2210-arduino-imola.dts =3D> qrb2210-=
arduino-imola-base.dts} (85%)
>  create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-video_=
sound-usbc.dtso
>
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index 4ba8e7306419..e89a0e77072b 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -193,6 +193,11 @@ qcs9100-ride-r3-el2-dtbs :=3D qcs9100-ride-r3.dtb le=
mans-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs9100-ride-el2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs9100-ride-r3-el2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qdu1000-idp.dtb
> +dtb-$(CONFIG_ARCH_QCOM)        +=3D qrb2210-arduino-imola-base.dtb
> +
> +dtb-$(CONFIG_ARCH_QCOM)        +=3D qrb2210-arduino-imola-video_sound-us=
bc.dtbo
> +
> +qrb2210-arduino-imola-dtbs :=3D qrb2210-arduino-imola-base.dtb qrb2210-a=
rduino-imola-video_sound-usbc.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qrb2210-arduino-imola.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qrb2210-rb1.dtb
>
> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/ar=
m64/boot/dts/qcom/qrb2210-arduino-imola-base.dts
> similarity index 85%
> rename from arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> rename to arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-base.dts
> index bf088fa9807f..fb22effb9a35 100644
> --- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-base.dts
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>  /*
> - * Copyright (c) 2025, Arduino SRL
> + * Copyright (c) 2026, Arduino SRL
>   */
>
>  /dts-v1/;
> @@ -110,6 +110,106 @@ multi-led {
>                 leds =3D <&ledr>, <&ledg>, <&ledb>;
>         };
>
> +       sound: sound {
> +               compatible =3D "qcom,qrb2210-sndcard";
> +               model =3D "Arduino-Imola-HPH-LOUT";
> +               audio-routing =3D "IN1_HPHL", "HPHL_OUT",
> +                               "IN2_HPHR", "HPHR_OUT",
> +                               "AMIC2", "MIC BIAS2";
> +
> +               mm1-dai-link {
> +                       link-name =3D "MultiMedia1";
> +
> +                       cpu {
> +                               sound-dai =3D <&q6asmdai MSM_FRONTEND_DAI=
_MULTIMEDIA1>;
> +                       };
> +               };
> +
> +               mm2-dai-link {
> +                       link-name =3D "MultiMedia2";
> +
> +                       cpu {
> +                               sound-dai =3D <&q6asmdai MSM_FRONTEND_DAI=
_MULTIMEDIA2>;
> +                       };
> +               };
> +
> +               mm3-dai-link {
> +                       link-name =3D "MultiMedia3";
> +
> +                       cpu {
> +                               sound-dai =3D <&q6asmdai  MSM_FRONTEND_DA=
I_MULTIMEDIA3>;
> +                       };
> +               };
> +
> +               mm4-dai-link {
> +                       link-name =3D "MultiMedia4";
> +
> +                       cpu {
> +                               sound-dai =3D <&q6asmdai  MSM_FRONTEND_DA=
I_MULTIMEDIA4>;
> +                       };
> +               };
> +
> +               hph-playback-dai-link {
> +                       link-name =3D "HPH Playback";
> +                       cpu {
> +                               sound-dai =3D <&q6afedai RX_CODEC_DMA_RX_=
0>;
> +                       };
> +
> +                       platform {
> +                               sound-dai =3D <&q6routing>;
> +                       };
> +
> +                       codec {
> +                               sound-dai =3D <&pmic4125_codec 0>, <&swr1=
 0>, <&rxmacro 0>;
> +                       };
> +               };
> +
> +               lo-playback-dai-link {
> +                       link-name =3D "LO Playback";
> +                       cpu {
> +                               sound-dai =3D <&q6afedai RX_CODEC_DMA_RX_=
0>;
> +                       };
> +
> +                       platform {
> +                               sound-dai =3D <&q6routing>;
> +                       };
> +
> +                       codec {
> +                               sound-dai =3D <&pmic4125_codec 0>, <&swr1=
 0>, <&rxmacro 0>;
> +                       };
> +               };
> +
> +               ear-playback-dai-link {
> +                       link-name =3D "Ear Playback";
> +                       cpu {
> +                               sound-dai =3D <&q6afedai RX_CODEC_DMA_RX_=
0>;
> +                       };
> +
> +                       platform {
> +                               sound-dai =3D <&q6routing>;
> +                       };
> +
> +                       codec {
> +                               sound-dai =3D <&pmic4125_codec 0>, <&swr1=
 0>, <&rxmacro 0>;
> +                       };
> +               };
> +
> +               hph-capture-dai-link {
> +                       link-name =3D "HP Capture";
> +                       cpu {
> +                               sound-dai =3D <&q6afedai TX_CODEC_DMA_TX_=
3>;
> +                       };
> +
> +                       platform {
> +                               sound-dai =3D <&q6routing>;
> +                       };
> +
> +                       codec {
> +                               sound-dai =3D <&pmic4125_codec 1>, <&swr0=
 0>, <&txmacro 0>;
> +                       };
> +               };
> +       };
> +
>         vreg_anx_30: regulator-anx-30 {
>                 compatible =3D "regulator-fixed";
>                 regulator-name =3D "anx30";
> @@ -165,6 +265,7 @@ anx7625: encoder@58 {
>                 analogix,lane1-swing =3D /bits/ 8 <0x14 0x54 0x64 0x74>;
>
>                 pinctrl-0 =3D <&anx7625_int_pin>, <&anx7625_cable_det_pin=
>;
> +               #sound-dai-cells =3D <1>;
>
>                 connector {
>                         compatible =3D "usb-c-connector";
> @@ -198,20 +299,6 @@ anx_ss_in: endpoint {
>                                 };
>                         };
>                 };
> -
> -               ports {
> -                       #address-cells =3D <1>;
> -                       #size-cells =3D <0>;
> -
> -                       port@0 {
> -                               reg =3D <0>;
> -
> -                               anx_dsi0_in: endpoint {
> -                                       remote-endpoint =3D <&mdss_dsi0_o=
ut>;
> -                                       data-lanes =3D <0 1 2 3>;
> -                               };
> -                       };
> -               };
>         };
>  };
>
> @@ -225,11 +312,6 @@ &mdss_dsi0 {
>         status =3D "okay";
>  };
>
> -&mdss_dsi0_out {
> -       remote-endpoint =3D <&anx_dsi0_in>;
> -       data-lanes =3D <0 1 2 3>;
> -};
> -
>  &mdss_dsi0_phy {
>         status =3D "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-video_sound-u=
sbc.dtso b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-video_sound-usbc.=
dtso
> new file mode 100644
> index 000000000000..6fb256498cd1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-video_sound-usbc.dts=
o
> @@ -0,0 +1,61 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (c) 2025, Arduino SA
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/sound/qcom,q6asm.h>
> +#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
> +
> +&anx7625 {
> +       ports {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +
> +               port@0 {
> +                       reg =3D <0>;
> +                       anx_dsi0_in: endpoint {
> +                               remote-endpoint =3D <&mdss_dsi0_out>;
> +                               data-lanes =3D <0 1 2 3>;
> +                       };
> +               };
> +       };
> +};
> +
> +&mdss_dsi0_out {
> +       remote-endpoint =3D <&anx_dsi0_in>;
> +       data-lanes =3D <0 1 2 3>;
> +};
> +
> +&q6afedai {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +       #sound-dai-cells =3D <1>;
> +       dai@18 {
> +               reg =3D <SECONDARY_MI2S_RX>;
> +               qcom,sd-lines =3D <0>;
> +       };
> +};
> +
> +&sound {
> +       pinctrl-0 =3D <&lpi_i2s2_active>;
> +       pinctrl-names =3D "default";
> +
> +       hdmi-i2s-dai-link {
> +               link-name =3D "HDMI/I2S Playback";
> +
> +               cpu {
> +                       sound-dai =3D <&q6afedai SECONDARY_MI2S_RX>;
> +               };
> +
> +               platform {
> +                       sound-dai =3D <&q6routing>;
> +               };
> +
> +               codec {
> +                       sound-dai =3D <&anx7625 0>;
> +               };
> +       };
> +};
> --
> 2.53.0
>
