Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FB83EF64F
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 10:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785146469; cv=pass; b=WiDrJvOs/LDtmTTzeXgx6JcCPLIkUrVYGw4FJ8o/1aoewSY9RjmXEcRkzcgZEdEjXujtlGWpA4edi2QSGuhL4lUrCurWuiHf43FSXc/u5o4PLU77jobtNAhO5/pyIrtk7r7J+0oiy3LgRH90WOx7ir6adDsBPp/vilSy9m6JW0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785146469; c=relaxed/simple;
	bh=PeyKN0baBhutHLbY8tpY5GwoAhsXPzOWCm1h3cCqBJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HyZg2e1tjG91OOAcPqFYncr2cn9NwS08cwhhOtKRNVdRHNhh1qDai8NiSirobWrnfQvrsh7+xH5CmQRMkEdEwta4DzPUQKnpynsfxzWtPdNWbrVfTNsd9IOj3p2vur5KzVA1LZDOTKQ/iXNQO6Q5Im75CD614wqnZ42QClBB+Ck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pR4g/VVD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AFSLJua7; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pR4g/VVD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AFSLJua7"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R9Wxs83481646
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 10:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fpxga49hr34rpRcBFaAC1QHjhjtKMHjA32E0mhgUj/8=; b=pR4g/VVDUj1stCtg
	quKe4ihAM1gvEsgmlEWtE+21OkUdNfPYciwb+yeHh03cLS28HXTex7gEzog62RaL
	N2d+cDiCvfrdjXDv8RwdHJAPqnMTlDlAy0hkXz0A4ojGe/T2xLeCu/2mk7GLi0ZW
	UrFvVAjMy3d4gC2jrb7+l3RyUUQ7OWlxF76JT8b86VGb1eTfc3nLfUX9X43DLp38
	G3s+8zd4R4gvaQq4q7cW5lhV98s5ca06f27h24pcadY3WichadQZPEJz/PexHuYd
	L93y8Az+sWt+fkf/DiFr9bTxglVYH/hyXM8gz+lEINLIgpczhK8smEgferrZ3EUK
	vAU/MQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mq05ap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 10:01:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e606e8f3eso210762685a.3
        for <imx@lists.linux.dev>; Mon, 27 Jul 2026 03:01:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785146466; cv=none;
        d=google.com; s=arc-20260327;
        b=VhRaI3vuzZj01CIXCu3OuXNlv2EvACj8L4YTAfjkV3v6peG7jjLP801ZBYvsfSJvYu
         HO0Bf5iZ4WbBRwpkprUAZhpT473Qz0CmVuXErLFcxa2+dJdzFrlOHTokjVUfiCwHgEY1
         BHZwZx4gPRow641NDg+PUv+N20RRIBNRj6CFdWXDcPjPWmTUkv8+5WH+3a1o2lA6NpZN
         ZWEOQtQyrBniStAE1r19XqWcTOmfvDYX3JW1xw+G8zDVWpfjmIH7Z+veTv8LmAbOEkNw
         7T8btaVF9AUmMImOmWtFK90UqMBED3Syv9aVkBnIDp0FjKhcrpb1zyNXzcdq9zkAsKpO
         Regg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fpxga49hr34rpRcBFaAC1QHjhjtKMHjA32E0mhgUj/8=;
        fh=02IIEC9n5C/HIH0Bl12PCv6tPvvfXAnTaCg43gAKymQ=;
        b=oR3f7D3yD10RGrDX49hP1jW13wT1KIJxOhCLun3U9WnByyM9uS4pFWNNlYkv+OXtL3
         6VpTNl5JWzB5+mmgqpJ6QTtoCIsha/jiHsFDMs53cpjTPg8kaGJbDIh8dU44x24Ta9tp
         MX7E5fv+b10yNWJ6YouV3qvdY4gRdEcHqMIfF3vXJwugYNkviWDe+IY38QIxX9cCe/uK
         7jyPZYtJ1/SaTO2vpi5Qjf5hHTqiwiX5THMvlURcOfCmzUVK+TcM4/fprCX62Ht9c7Fb
         DMUt2aCdsWLds8Rdy/dwFSzkBy7YJkJnDWYd06mpiOEL75VC25OgGXmI1fZgaXpfNik2
         BZJg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785146466; x=1785751266; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fpxga49hr34rpRcBFaAC1QHjhjtKMHjA32E0mhgUj/8=;
        b=AFSLJua7T1rJ2QolU8AT4aDzmIYqDxkuhrGhdW/RGNcLGOP6UX8voFZo1x4O/gpLda
         4Or8rtyVBpBQDGVxUuMS18viBwf3+i3tEV9MB7z9PzQpJ69x8ETlDll7QASO0M+zhL3G
         y6I9+wGyIKmkHpPJaJsx40sVVRGx2Ct5KfMt12jM1OM9uVOhCzYnySix4Pp0EP4Z/Tkf
         Fojtlu6kUHEnNu5UIZzZ3KkbdvQNn/kjNABa9OiRAkDjluyPpMIwaStBx9mR++vH2lDL
         KUg7DspNahBq1OJWIsGdQXYg5IX4AaaStvifuQw163OsKHwiUlzVYrXlKcNyJj7LxuaV
         HcJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785146466; x=1785751266;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fpxga49hr34rpRcBFaAC1QHjhjtKMHjA32E0mhgUj/8=;
        b=G1Lxs4SKKU1IMsOTD64DqUebLaTgoTttaePII5tJtZn9CKsmGb5H/vuyd3KavnejNm
         +lcfGjgiOQJA+kjLDYaMPkGF3PSW0gZ7Pfir5IODRdiyR/7eEp7jQJr6ETW2u6Uj7s03
         gQIk9Aos2uwP37HMqRFN+uhfq0hRc2s4vtIrmoqTluStT61LCArC8fr7WJxWgI7jnZC0
         fjUQL705NxkUdForHz3PNfp3DweXey7u2S1MXp+FAopQ5k0ohfkpOCN1SSbA6jd/ImLH
         ZhKhAEiLhFCC8g1kNk1LyTWu+tCFgIrhcEw3p/EpXsMNN7MgRgZqARHLZiVn7yfojcGF
         IH4Q==
X-Forwarded-Encrypted: i=1; AHgh+RqFPNj3SNpzxygc8YN15ScABH457n7ch6OzFbjdd5BAy9htzfYXDCBTmbDwlDqUqLrK21o=@lists.linux.dev
X-Gm-Message-State: AOJu0YxG1YWCJA1rrXZKOEoQi0Lkeu1dviwzElBlaEMdSYNOCZL37ytT
	f13lp4fW9/CBatj+WRDmidvUznEC2Ha4KmEJpEZOG79s75mLB7SQrn1vNoh1CY8fPSryGVy3L+/
	k8SXk1GauCiZ5X0fkV0JpVJTYASuhphVvSgVNqjmQLj5IIEOWDdosrR2lXu7a672Pyb/Xkr9S6e
	jBdCr2CePRaOLpPAWSoA/zXAcU7TeIfw==
X-Gm-Gg: AR+sD11awbFScw4L5SBc14hWy5LMJgsWdK9gTr/BYDqccKyqU/+uGZwu+E0+rM9Q/UF
	AA22NtgWbraTyAX2OvFypmYDtfMYWNJ9wFWUMfj7JJmsJJ++U5/SQ1yQyhIZO83K/85qXiuKmW8
	6/oVAHgUAyR6tq/t+50BoQw+uI+vltI+/5/zEfJPspxk0QdJKqjdn9LVqxrQ==
X-Received: by 2002:a05:620a:2688:b0:92e:745c:6c5a with SMTP id af79cd13be357-932f948144amr15114585a.14.1785146466252;
        Mon, 27 Jul 2026 03:01:06 -0700 (PDT)
X-Received: by 2002:a05:620a:2688:b0:92e:745c:6c5a with SMTP id
 af79cd13be357-932f948144amr15109385a.14.1785146465706; Mon, 27 Jul 2026
 03:01:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260723020524.1886806-1-Zhipeng.wang_1@oss.nxp.com>
In-Reply-To: <20260723020524.1886806-1-Zhipeng.wang_1@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 12:00:55 +0200
X-Gm-Features: AUfX_myrKTD-P-po5naXNkkd8gbbZmT-1aLEtXL0NN10jCpUSfBDEv1NDisfyg0
Message-ID: <CAPx+jO956WAqXt-zbEyzU5btS7KsXn4fBemaj4r3qQNANNJCKA@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] pmdomain: imx: build the SCU power domain driver
 as a module
To: Zhipeng.wang_1@oss.nxp.com
Cc: robh@kernel.org, saravanak@kernel.org, ulfh@kernel.org, Frank.Li@nxp.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        peng.fan@nxp.com, aisheng.dong@nxp.com, jindong.yue@nxp.com,
        xuegang.liu@nxp.com, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA5NyBTYWx0ZWRfX99czmWIH2PXO
 lI717zU60Sqd10oq74TgOJ+D+iHDCfDqB2gI8IK6WE5VxUN3vXwyjObi34NKGBon52RXLYp24TY
 Ba9ka0PvdmFu0dsJANpvPICgiRild/0=
X-Proofpoint-ORIG-GUID: GYms_LTGqrGTBaN-vNvAruyqVxuqg-Nf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA5NyBTYWx0ZWRfX4lBO6QSspF5Y
 ogjNLMQkPgGt9I0KxB3PnsgfdEMtKkxjNMuwbRYDXJ7jfHO91Wq7HYWH2SHPF04+aAZwLskZZIH
 EtkdM63f/2gFxksk4ucLfaO8wqBkGsZPwRg9DEWA8fEwC1WqaHIzs0jK3OoXXvg/EB5e+QzKeR6
 Tx5tokwxOGTBoyjP4Qm729K/tfW4ha7OvhwE0izKUWas7nH1zMtt89DFO/2h4XqB2r+iP17fGJV
 9JnHAKBWo16jFP6djb5IZcogUPgJZLfiX7WLO3wb7RbiATrxIK+bjqAdQ5VcUFNGuyUKCGUEko0
 IYwEWQfsFlEycIeXja5wxzHNMWEfHJsH3BnyB4J6EwgN8g9Set/JzR6/1fwRzDvtsn3s0YZpwyc
 X5sf/ieFjVs3Vu5opKX3K51gdCoAi/uOdd/T13jpenCLXPlM3yjkODYXfHLXuMf0dE+Lnj02YKq
 650BF1/NXowmNHrNMtQ==
X-Proofpoint-GUID: GYms_LTGqrGTBaN-vNvAruyqVxuqg-Nf
X-Authority-Analysis: v=2.4 cv=TemmcxQh c=1 sm=1 tr=0 ts=6a672c62 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=8AirrxEcAAAA:8 a=73SNKA1z6Gcgn0qlyfgA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270097

On Thu, Jul 23, 2026 at 4:05=E2=80=AFAM <Zhipeng.wang_1@oss.nxp.com> wrote:
>
> From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
>
> This series makes the i.MX SCU power domain driver buildable as a
> loadable module, which is required for Android devices using the
> Generic Kernel Image (GKI) where SoC-specific drivers must be modules.
>
> Patch 1 exports of_stdout (which the driver references to find the
> console's power domain) from the OF core with EXPORT_SYMBOL_GPL().
>
> Patch 2 converts CONFIG_IMX_SCU_PD from bool to tristate and adds
> MODULE_DEVICE_TABLE() for autoloading. subsys_initcall() is used so
> that when built-in the provider probes before its consumers (e.g. the
> SCU clock driver at device_initcall level). No module_exit() is
> provided since the provider cannot be safely removed at runtime.
>
> Patch 3 adds MODULE_SOFTDEP("pre: scu_pd") to the i.MX8QXP clock
> driver so that modprobe loads the power domain module first when both
> are built as modules.
>
> Because of the cross-subsystem dependency (patches touch drivers/of,
> drivers/pmdomain, and drivers/clk), I would suggest taking the whole
> series through one tree.
>
> Changes in v5:
> - Fix MODULE_SOFTDEP module name from imx_scu_pd to scu_pd. (Sashiko
>   bot)
> - Add Acked-by from Rob Herring for patch 1.
>
> Changes in v4:
> - Add patch 3: MODULE_SOFTDEP in clk-imx8qxp to guarantee module load
>   order when both drivers are modules. (Sashiko bot)
>
> Changes in v3:
> - Use subsys_initcall() instead of module_init() to fix probe ordering
>   between the power domain provider and the SCU clock consumer when
>   both are built-in. (Sashiko bot)
>
> Changes in v2:
> - Drop module_platform_driver() which provides module_exit() and could
>   lead to use-after-free on module unload. Use module_init() only, so
>   the module cannot be unloaded. (Sashiko bot)
>
> Zhipeng Wang (3):
>   of: export of_stdout symbol
>   pmdomain: imx: scu-pd: allow building as a module
>   clk: imx: imx8qxp: add soft dependency on SCU power domain driver
>
>  drivers/clk/imx/clk-imx8qxp.c | 1 +
>  drivers/of/base.c             | 1 +
>  drivers/pmdomain/imx/Kconfig  | 2 +-
>  drivers/pmdomain/imx/scu-pd.c | 8 +++++++-
>  4 files changed, 10 insertions(+), 2 deletions(-)
>
> --
> 2.34.1

The v5 series applied for next, thanks!

Kind regards
Uffe
