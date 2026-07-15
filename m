Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873003C3BF1
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 07:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784101990; cv=pass; b=XaTFssVl1F3UvlIEIPneXxl4Cgw5PkoaT30BEDRby/xePoj6u8M2ixOnzPfMwEjZ2YeyBDSX3epI4E0373dxg3aRgZhmVkR6k0HtczZzb+QrvrrkUnm49xJ9A0POZEEUI57wWvigKAqQ+S6IR5aCLkvicBwEuDiUAuBz/GVSZGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784101990; c=relaxed/simple;
	bh=9YX4dE+yfNDLsdJvZJbsFDglIGvjVkjjw2Mk4BuFTmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cx2ra2Oob2m3j+DuwBN/DsppYhy9IJBvdm1VFtx+fi/7TtYomggdEu0GgPwtLUJE4+VKaPv4ODMI2uNUs+lTfthPGUTJn8RNKGENJL7B56r8OuAz3rtn+T9jBk4zESf3Kkmh/Cc+LBad3Ujr2yuOFC+/jbysbmq4BJTzBMdPfJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sz+G2/VC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bzQwh1Fa; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sz+G2/VC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bzQwh1Fa"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3lQxX2621442
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 07:53:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pLek28axscsCPFWO/Z/JAne78HjenYIUsRjAVNxPzWo=; b=Sz+G2/VCYAbYlEVg
	GWsJHKNm/x1ElQWVGvbElyl795HC6WCN4WOhRCllGM8MOAU9YVPnUWr8nfjcAj6i
	AfSomJ/oRUOA3Mpk3ehnz7XD8cWUfB+0uWBqAwm3idNoqVq1AmKS1wwbYXZGoOFr
	r3KTmwK91J9i6vmnou7C9BY4g2JzkWu0XEGw7BC13GwG8SLrMptnde32Ho1XXUGg
	XA+F/DEH3kkYbV9gzNSVNTxYbS8tG+fOBnscHcvIuEqpcfffLy2HYYhbUoiu8Vuq
	Vd7b2v6BncOCq6mdqgj3DU4gg6I21hUDnOF95n2wcQAb4eMkyvFISLWK1xBypWod
	pKDHNA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe03vh7wd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 07:53:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e55f0613cso622673385a.3
        for <imx@lists.linux.dev>; Wed, 15 Jul 2026 00:53:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784101981; cv=none;
        d=google.com; s=arc-20260327;
        b=Lpzy3UKOcpDb2RdpJmw1wXOvxbj+7bCqY2Ps8MeBFbP7yB0Pn15iQ9bmSBWHNRgAsw
         +5B9TZxyLbxXv8NqE3E+mjXFmQ8UbZ9WSJS+Yl1DMi/L1YkUO8UEPz+gSbfD2BDfQ1gG
         q9xKu0y5CwSji9kZWQ7fz5l1Csk5pJTn0W7C2Oz48BsQtBgkBUfsRjLkvA6fHFxM/7Ff
         3JqDIn49hWIUo/lTL2GqdCjKBzSv8QzMncHU7xpt2yAM4JMtBAdXW0qAhfiFou7Q9O8I
         zr5B1UVpWQBrhf3EXGwyg2PZizX8LvtC8uV4bUGctRU3nLtTyE/jAYCW5u52ZB4j7rJc
         PY0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pLek28axscsCPFWO/Z/JAne78HjenYIUsRjAVNxPzWo=;
        fh=cbuNVsin1zU3C/zUCaEbnYoZ3zqHF4K6t2z3KTdLDpw=;
        b=Oljf8f+IKQ9ci6OFJbP1gtQt4zmxBDWRquW3X+Kc3flo1R+d6WZWCwJgVvzI6dgaty
         kyszVMOdmCrRkbyDB7nvFA6UuVGtX8Iy75fxgUw0r+l2rWlE2j756iQipe0rZDGLskyt
         RsLYmEcfw1aiWd1B93NEGR25esdVnuiq2Qe3/l5mJu0j1QufSMaTdc19uIPopB6jHk5O
         sARfpFoUT/RXUnBagvoJoLunsHgCLAvLRSRnPBZTAwrilJT5ZlnVziAFoAe/Lp2+FWR2
         aNAhHCQD6+F+u/DVXExjMzL/hA1KQyF/CmvRwdXxHrjhFSizuRSrwT2sLGrSNatACehS
         i80A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784101981; x=1784706781; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pLek28axscsCPFWO/Z/JAne78HjenYIUsRjAVNxPzWo=;
        b=bzQwh1FaFHZqzr8kl+XkYwB5MgTSpDheyLPfqG8jyrMN3kYSR8U0wddOAFh7s8kVHZ
         vr1l062V1KA8wchkeQ6E0mXdnXi+XYKdHzZB+U+HKVSvVGY8klsXqVglpzioNHFCh7TH
         5ZEtDrTwhv8AuvRIrngv7ao6UP68/FSS8LV/8DmweOxhRTvYOQHpdqQ/NrGugawpKd7J
         E0iEEWGeGEPQt9F0ys2i3540zHFlKsoYCQDjZJZgLtLSGUker51hUkygmHfHKUg6jhcM
         H+mPCAbDIT524Y4DqZL/VKuRZ8n3f9/mS7mgBsPGaAtmxQLxZhCrotMIDeKpmFJ2c4pq
         yWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784101981; x=1784706781;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pLek28axscsCPFWO/Z/JAne78HjenYIUsRjAVNxPzWo=;
        b=QRATK+ES/1jxd+85NCV0GxhtgK51vSwwtvxs/PUDhg7HMwluleU4WBGucjG7fQv07c
         nyPHn9cXb6KWlleh+YnS6N/y3q1/+NXREcvTlvzjZy5t2vSZMHj/sC29oKS3/oygYrmy
         jSu+MqKuL/J8N5opU7cWRlWfwawV8UN1A3Edapcj2QLfregI7Pc8ZDr4xox77/qhneSQ
         sEFw81eoS1D2hkjOzLttrV8UHfnwY30YLkWWnw7s8ERwLlVV25g474EIb+xlqD2uJGwJ
         g7qf2J2tE2F/lYQIMUovtEhzUngjNpxbr5x57P7FfEqY0WtWfUZ4j85NoKotWzHpkrFo
         2buw==
X-Forwarded-Encrypted: i=1; AHgh+Rp4la/MDU0Ri8qypKC1oswsYLKYnEGOWHs09UrxTSwCuXIqO6pE/4ZXtHd5Zm+i8EaW9m8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxuWyELWCuV61AtExeGUcV6xOdRROwshm+8GnawKmZ7t/nu7qWl
	w0UufUeYF85X+Sbmxvc/ug/l53G3CjowRqQ8gFl1E4epHBo0xQ4EXKPp9iAdDcty0kXQYJrzVT/
	2xGU7pULjDCnkLJpmTAik0+YH4Jmo/JDSk4CGHsupSqFua2tY/cQ/zOlZI+Q90N/omWctG05Cwe
	kOc6LSd7IRgXdsIEdRGqyNkNtZ/jnVoA==
X-Gm-Gg: AfdE7ck0izNyy2t0JFAJTHPUBcphtr8r/ARAb4mcIbokXcwRFAoUm/WRSq2uegkfvSJ
	L4RPt384aOBREwJo+MSiDmuwSujTlaZzktsWwAh1HzSx9czXA8q7Iegi6eNc8pDrjxUtJwyOwBh
	SxVxnoeRNqucVVZ6iihEUHEcfWdLrs2d6WRo2aVzjYPLjz7PRsHEaPcC+cGvaytomyioQdNzWWH
	gsBX6t3KwAf517CFBLm57bjuyW7dkb2F9swI69xeGWNsNpicNNqFAEMszVTc90tsRf+EV4ytTeO
	gMbidN94pM4=
X-Received: by 2002:a05:620a:600f:b0:92e:8210:fff9 with SMTP id af79cd13be357-93086bea55cmr545860685a.56.1784101981005;
        Wed, 15 Jul 2026 00:53:01 -0700 (PDT)
X-Received: by 2002:a05:620a:600f:b0:92e:8210:fff9 with SMTP id
 af79cd13be357-93086bea55cmr545858585a.56.1784101980599; Wed, 15 Jul 2026
 00:53:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com> <20260713-shikra-camss-review-v5-3-db53be15dc4f@oss.qualcomm.com>
In-Reply-To: <20260713-shikra-camss-review-v5-3-db53be15dc4f@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 09:52:48 +0200
X-Gm-Features: AUfX_mylGXRGoAJ8WLPXjHG-LrYjgeK28hgV3O_EXafPt2RbMf7pLiI-38KOrs0
Message-ID: <CAFEp6-3MrGLyTQ5+qaZ2nF=EWLgOhepTB41CwEEQZwJ6zQh8Rw@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] arm64: dts: qcom: shikra: Add CCI definitions
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Ife3n2qa c=1 sm=1 tr=0 ts=6a573c5d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=U2PIo7JDszhCzVx53KgA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: FP1IoEnn8JXh1MhFUVQZtJMK9zHwucXN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA3NSBTYWx0ZWRfX8yP/YU0WDu45
 Rg8IpcoENBuiF+07bZAsu9ZQ3JYrDRpB041evb2hqsMcOv4w1ya7GyyI06t3PupQ2a8kQ2HDT+R
 OJLZPMcD5Y/op58LUzrs5NdJHH9yRHake+ladO2oORYYJD+xDHRXiqQowp8ZU9ZhBfm8Ey03wQp
 m2ADrzw1oBngaX1jVJQvasiRaRW9d59SXDJCCe4jFlFnEpIL+ab+OwNGC8ADzuyiqamzhjjA9bc
 VSlLGRalRIl/3hjCAfVsgGXAoMKbcXRfklcLzluBLFCPnWS+Avk4S1U6Qe8aEr9yZLIV/pIuPr/
 P1YcsC6mVWUzruRzxrhRTqYLQ6ifI7YNSFo13ZLx52cF93t/L2TyIHUf78J7r+GKgKKab9uU1au
 ekZOaujdgL7vnP3REoO71tKr39bkOD/4v/E8iDd8aLOQHA+TIKyQVTxRzPHrPPc2PM/ItLN/CW0
 5A6GbKFtPbIsnlz+Jhw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA3NSBTYWx0ZWRfX7c1Gw9MShXBh
 a5k1MndUDG4YCpBGBz3rm4glaU7TqUt6/eHvQL3X3CLHsfQeHAfVD/+dNsxmoQyNPwk/8Lehbo4
 45p46mEV1WKycoZrujHZbXQTQE0GYMc=
X-Proofpoint-GUID: FP1IoEnn8JXh1MhFUVQZtJMK9zHwucXN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150075

On Mon, Jul 13, 2026 at 11:29=E2=80=AFAM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
> Qualcomm Shikra SoC has one Camera Control Interface (CCI)
> containing two I2C hosts.
>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 70 ++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 70 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/q=
com/shikra.dtsi
> index 6335caca329808ee04d9067f1f95e8075e2fc3ed..18da1380e52acdd8813625eac=
eac796e342efd16 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -355,6 +355,38 @@ qup_uart0_default: qup-uart0-default-state {
>                                 bias-disable;
>                         };
>
> +                       cci_i2c0_default: cci-i2c0-default-state {
> +                               /* SDA, SCL */
> +                               pins =3D "gpio36", "gpio37";
> +                               function =3D "cci_i2c0";
> +                               drive-strength =3D <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       cci_i2c0_sleep: cci-i2c0-sleep-state {
> +                               /* SDA, SCL */
> +                               pins =3D "gpio36", "gpio37";
> +                               function =3D "cci_i2c0";
> +                               drive-strength =3D <2>;
> +                               bias-pull-down;
> +                       };
> +
> +                       cci_i2c1_default: cci-i2c1-default-state {
> +                               /* SDA, SCL */
> +                               pins =3D "gpio41", "gpio42";
> +                               function =3D "cci_i2c1";
> +                               drive-strength =3D <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       cci_i2c1_sleep: cci-i2c1-sleep-state {
> +                               /* SDA, SCL */
> +                               pins =3D "gpio41", "gpio42";
> +                               function =3D "cci_i2c1";
> +                               drive-strength =3D <2>;
> +                               bias-pull-down;
> +                       };
> +
>                         sdc1_state_on: sdc1-on-state {
>                                 clk-pins {
>                                         pins =3D "sdc1_clk";
> @@ -702,6 +734,44 @@ port@1 {
>                                         reg =3D <1>;
>                                 };
>                         };
> +
> +               };
> +
> +               cci: cci@5c1b000 {
> +                       compatible =3D "qcom,shikra-cci", "qcom,msm8996-c=
ci";
> +                       reg =3D <0x0 0x05c1b000 0x0 0x1000>;
> +
> +                       interrupts =3D <GIC_SPI 206 IRQ_TYPE_EDGE_RISING =
0>;
> +
> +                       clocks =3D <&gcc GCC_CAMSS_TOP_AHB_CLK>,
> +                                <&gcc GCC_CAMSS_CCI_0_CLK>;
> +                       clock-names =3D "ahb",
> +                                     "cci";
> +
> +                       power-domains =3D <&gcc GCC_CAMSS_TOP_GDSC>;
> +
> +                       pinctrl-0 =3D <&cci_i2c0_default &cci_i2c1_defaul=
t>;
> +                       pinctrl-1 =3D <&cci_i2c0_sleep &cci_i2c1_sleep>;
> +                       pinctrl-names =3D "default", "sleep";
> +
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       status =3D "disabled";
> +
> +                       cci_i2c0: i2c-bus@0 {
> +                               reg =3D <0>;
> +                               clock-frequency =3D <400000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +
> +                       cci_i2c1: i2c-bus@1 {
> +                               reg =3D <1>;
> +                               clock-frequency =3D <400000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
>                 };
>
>                 qupv3_0: geniqup@4ac0000 {
>
> --
> 2.34.1
>
