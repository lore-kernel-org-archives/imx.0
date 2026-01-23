Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0CD346AC3
	for <imx@lists.linux.dev>; Fri, 23 Jan 2026 06:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769151241; cv=pass; b=Mw8+3ZdhOGnbbbbTEI/mkYbkBnOJZu4Zhd1z2wxgMI0ktZYEJWEtFUY9NhVWqQunXlEWiAOJ+mpBFFfswp4HG2Tjj3H4y+Vt1iuDU+rMKj/To+rfpvgXNUKxhPxXVcMpmIaGf4VfpS0KMipD2MU8az3pD8Z63Wt8sBEX+fD4hPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769151241; c=relaxed/simple;
	bh=s/FYJs2yh0Mn9e9zJI3uFU6aHvmEISj88LdCakLhM38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fhmDde3fanyBx7STbj4UzRTfPCjbAJzWJ+FyPbSWOBMJKxJtZz7TVjskqat0FaWJ6V4l42r9KUwQ2BUHNg5BBotN+rSYJsPj4bA08UEhwB7HbU1Mf0jl6sQNuo4FZQmowkLsKgfWaIaQv7455I7phljsCeWJfWFhMxaWi0w4jhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b2/i92SU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CjRmIUF5; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b2/i92SU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CjRmIUF5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N5680n3656282
	for <imx@lists.linux.dev>; Fri, 23 Jan 2026 06:53:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s0VLzkj7kBAIvIeyO4Yw8QzJDHtyD3yHiv4q5/eKWxs=; b=b2/i92SUYiaESdwo
	VjpgHSfUiI9ApnLF4g+bN9LAW7zupMgnhCP4F9o8tLoJO7gv+VIdRuAgKrfweDLy
	YiZLR7ffNcNbVFBysSa3ZrZ0kOuzbK4SK/MykF6F/4rmfOTJy/xFloC7XR/3Cm7a
	00MPHEI8J1dbYMJ/4d2KB+bpBTZ6ZWt5ay5qh5w2ArRGpwyGy5wTEDUuU88a9ISf
	RJZcc39lq2fkNIq04SmCjD7HPi4JCp8INMfsq8smh0uOtBljMhR81ImMqt7kjgJH
	onVApRORNsJUohMQArtR0lksWoi4QJHICWbMkiMzJi91TVVjajjnQ/R5efOFfgxb
	Ijc6AQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bv2hw8awc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 23 Jan 2026 06:53:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a2d8b7ea5so21916906d6.0
        for <imx@lists.linux.dev>; Thu, 22 Jan 2026 22:53:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769151234; cv=none;
        d=google.com; s=arc-20240605;
        b=G2R0DGZQhWR10CmfU+UvMqWCI/wTmI0AZVnxpISRTCjJ5OTjUGafn3ZODzX0JlWOJq
         rTqYCreH3cmQMgfEFDOBoaDT3Z1FUSgdPnOJkmM49Ih8TCisqIMU2fO38sMo6hb2mlN/
         9HrhmcGKmAfXNQFpuz9ldZVV0uFn+vHYZ/j+r7uYgeT0X+Ze1zqBlG+1Uh2PwQI0Y59S
         yNMKEBRxNPOjZaG5QWbcqJPdZJdd1WupJUisZZ3rIIg/84oBvPkX2d3XZ2F22kBxCZJk
         RLS5WRi7g9OxNth773mj0tIdMhcqzxFCIFv/3oc8jWtE3H0Sq0ZQMnf43/8Crjrfu2Ax
         I3Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s0VLzkj7kBAIvIeyO4Yw8QzJDHtyD3yHiv4q5/eKWxs=;
        fh=hX/MiLHlDysU+KKYBuUJx3pUuU4GkJNEpKwLvppxnHw=;
        b=fHer0M6PBBXrmgd8HN+MG2wuWPVfY+NIK+/IxRK7IqCfIZUbcypmltxX3PcFDCh9Rc
         YOwcihR/0k4YYUIhCtUgw7oRrvy4Y2KpiFfjK58CrS6JofapOX3cI9dzeJ9blcGsgItS
         B2itzvZ4KrVZQWUEXZ+eG3RGnBWuxY/nlRAxWrozCk78ihbfVW3/BHXH1/nfC2RG3xQW
         NFO5MEXmflvrDyCnC7BA7uVk7y47MMdYFptbgNFjkcULneE379w2Vzwhos57RScrg9hs
         /wQ/XDbRfrSBNeBvQ9VIzu5P+8JGBDt/2Dx4AHOk2cAVNJSmmKg4KxXbjNZMXIB1rEEP
         EM2w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769151234; x=1769756034; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0VLzkj7kBAIvIeyO4Yw8QzJDHtyD3yHiv4q5/eKWxs=;
        b=CjRmIUF5T1UpbKCk/jbj2e/eqRKAS9GFhoHo/D8NM0bktuM7BBg9IwN990XS6VQHYQ
         azGC6frXXTy9cypV/cSnwWce7C/0l8ZytFkkK+rdJY74NQ/7y98nSKHSSzpOWl5e5+5i
         IcNm652jDTH6q/Fixb8Jf6//IXSdmtwZEV5wdAjsjL7gcv36nlSW0Ik+6mqfiyyyfULH
         uUlxbkJ+1dot1pFgUXc+UXpdgTzzI3IWbupasF+rvcNd0xetnj9RZ0ogzlnh0C0MmNH1
         4FIgCj2lPFi3Lfx0APYKhphL9nO98o39I71pMoJMZ/UdxspuZgKdJDfclGW87pHj3pdA
         NPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769151234; x=1769756034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s0VLzkj7kBAIvIeyO4Yw8QzJDHtyD3yHiv4q5/eKWxs=;
        b=N/d7+PXIunZUJmEpK6gtUFvrpWf4KxlbM5pPEQobjkMNuaRQuXzsP2Z8oxSX8S3rxZ
         6TlKeM1XRG29iQXseKDOOzSUIkkakWroybzW8lWWxq2DXCo89hnFIpcaA8KCN9DsCgZU
         zvGeQkRcoxZZqoxdk4u/V0tzYRTIa4AeZUOZCp9pqsJfndFmUNq/I1zYr4i0g15kIuvP
         DDf/0JKIC+2P1E0Nk2ahs1lcR+UVEGUpBB7AaL0m5zSzxsyjat1u29vz3Eu0Cx+PjAjD
         CemJTQWfqbkzy7ZGFFB8pYS4tR/SgNsxJKAeOb2OiBgUs6iiQsY7PD4fJxDV+WAf9rOl
         ezPw==
X-Forwarded-Encrypted: i=1; AJvYcCV/PPO6Z43mxjv3ydllsyTV0TK+HfKKSYFPqMK9xuwy9bcuuLeljwSy7s54bWezIakwQes=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5BK4JAfZmnxcFn2mksDa5tVBK66GwPmN5HP5Aj9GDKsuXPB4w
	U51z09qp4Eu48eRWUM8LtI1C9xbNt88RWMBDvSfnluOQpVnFFK6vkcgdeTMAMeFag9c/0u+u/By
	Q2IrNt8OROUOUwzi1KSYPb0fkH+G4tdar84tmdArAewXUua+CoYDpAjegNBhl4ibUhOOzKowsft
	XVE3ojl67dBy56REnLDwBQTxMaop3mbA==
X-Gm-Gg: AZuq6aLkfzVdVIPIFJy676L67i3bcRhPJFjVq6Gap64QTAH8yXbk6gAlT4yY2tlLEmM
	d1DzGqXjrz4tscG+ECzJCp55P4vfTZoczlqkaJqd402IaES3zwp/jVoXifQPImfCtaeOevh0cdm
	3kVzYKtWpYfaNK0v1oN8HsMOVtcTQRYoyexoDLZ2ujtln7OeVC60SyNLVVOXJ4S5LJfoJalA3kg
	sqPSsvk/2RcPk3dKHXXH6zr
X-Received: by 2002:ad4:5def:0:b0:880:63b1:3f57 with SMTP id 6a1803df08f44-8949020d656mr29225186d6.38.1769151233727;
        Thu, 22 Jan 2026 22:53:53 -0800 (PST)
X-Received: by 2002:ad4:5def:0:b0:880:63b1:3f57 with SMTP id
 6a1803df08f44-8949020d656mr29224416d6.38.1769151232692; Thu, 22 Jan 2026
 22:53:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260122-sm6150_evk-v4-0-a908d49892e7@oss.qualcomm.com> <20260122-sm6150_evk-v4-2-a908d49892e7@oss.qualcomm.com>
In-Reply-To: <20260122-sm6150_evk-v4-2-a908d49892e7@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 07:53:41 +0100
X-Gm-Features: AZwV_QgW9xaHk1V60VCFg-RSltJOSQPj7qJ8VK_VnWofnB4yGozL2VT2va8zIr4
Message-ID: <CAFEp6-3qrfnn5EdLXX1+1qGtAZa=L4QS1nyCs23JnKq+oy=pqg@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] dt-bindings: i2c: qcom-cci: Document sm6150 compatible
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: Qi3W-iMaKrafde0frS5AyFrkjRP3FzOq
X-Proofpoint-ORIG-GUID: Qi3W-iMaKrafde0frS5AyFrkjRP3FzOq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA1MSBTYWx0ZWRfX8BDECyyBi7nR
 dpAmCbuXIG2MFPkkWyEwnJqixJy4sCeXTJUj84Ovm5XdAMMBydTwQbin1FHdi5jP2Mgd53QhORB
 rfQ5ileMFXD5BFaa+x72ziVuUpJgllhQhE4OfHa6GUkIa+gsW8I+ojojldFbam58m/RWLtdOCGB
 qiQKFP6jds7Yt6vG9YBcLEBDIjJiibJjqf7CRokmQE1QEd50T5X8TX2myIlozzyH/45zCfs4gzx
 KN2Lj2dgeeJm5sAyHpWTkFnxXqPOuFPBZY5I5PEEjnRKub2NhkFQl3jqzG27P1cYoprWiyr0nbP
 ueJ9HCJY25R82z4vVG3EXi3RSGHH9ufFyEUtUtPIMj3E5h8/YvN5X4338uiF+soOJxh7mLvOi7M
 A+Gg1vwqe7OSGcs88C1I6dSYMUJly1J4DBYpVlikR1TCH5W5ADh/gF9rn4ma+uoXwfxNseTWir4
 FtklBO0bLudVro+E8Gw==
X-Authority-Analysis: v=2.4 cv=A4Rh/qWG c=1 sm=1 tr=0 ts=69731b03 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=AGkvFC_LJttw-4NvuOEA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230051

On Thu, Jan 22, 2026 at 11:41=E2=80=AFAM Wenmeng Liu
<wenmeng.liu@oss.qualcomm.com> wrote:
>
> Add the sm6150 CCI device string compatible.
>
> SM6150 include three clock:
> bus: Bus clock responsible for data transfer.
> iface: Interface clock responsible for register read and write.
> cci: Clock for CCI core operations.
>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Do=
cumentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index a3fe1eea6aece9685674feaa5ec53765c1ce23d8..d3f87da54fcc14a8f808f34c9=
4551583d8deaabc 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -33,6 +33,7 @@ properties:
>                - qcom,sc8280xp-cci
>                - qcom,sdm670-cci
>                - qcom,sdm845-cci
> +              - qcom,sm6150-cci
>                - qcom,sm6350-cci
>                - qcom,sm8250-cci
>                - qcom,sm8450-cci
> @@ -249,6 +250,7 @@ allOf:
>            contains:
>              enum:
>                - qcom,sa8775p-cci
> +              - qcom,sm6150-cci
>                - qcom,sm8550-cci
>                - qcom,sm8650-cci
>                - qcom,x1e80100-cci
>
> --
> 2.34.1
>
