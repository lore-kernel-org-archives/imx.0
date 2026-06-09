Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAD63AB26D
	for <imx@lists.linux.dev>; Tue,  9 Jun 2026 09:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996622; cv=pass; b=OjwTz5oy4Inrn2fHXC5HdV6nuAuha/l7qsjfWPKD9AZeZrpQN29ulrHiV/mfh549bOZ8Pae8oJm2zlwykF+QufHnBDKn9PcQvVxSwd3WcX2zNIKS4HA3vnB5iRnhH7MRNWjJkyRz9h0qm92VEtfSIn/ro5oBGiOCla0ulE9Tw+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996622; c=relaxed/simple;
	bh=TaJIKM3O2Do2Nt4kIaUSWB8jEWE1Qwyap2u8PR62hB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cJX0X5pmE0qsaH7WJ8TAEJZ/NN+wBWfj9fD2j7WdoW62Vr3csatAcOtzcbKTIvHZbRafYLu6KlMeiB/JGjEal2XKQH8aFzjdNBGvPKslb0dZ1kU527tH9WPYwHUjIIw6iG/1XXQMVwwp8IesoTZdtnvCyQYT3lGV0WaVT+JRHhs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UiZHzBLy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dy0zu7bK; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UiZHzBLy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dy0zu7bK"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65985Vbk006918
	for <imx@lists.linux.dev>; Tue, 9 Jun 2026 09:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/EqyMxiE/m94G4SRX6R7mDsxcjVfUYvMbEvBF14uWFo=; b=UiZHzBLy4QyYM2Ks
	N5cm8P4GmceWbdMF1milaB0NUBQ8s4AgwRDCssevYujEjrAkBVTA4jO923lz9Wl2
	mHZLwHJZ9r9GTahp9dh4aqaIUTEyNiNYXD/1BiR1nRpKEwItt8gi/hY2+yWnGwp3
	kyDaQuGvCbrGquG6a87/sKd7qD3wBldP0Xf+ZCbT2dZOzOl26cLaMs2Glnpoa4KU
	CO8NGAjzC7sA+NRQxoXibKITV7Gj1Lunrh4O3pzo71nKvSo42DeUxG3zmdSyIc4A
	zWGSKMrq3mauzlsp5t4fkd9M8ITdZMiMRsQiJz8sP+KKviNRtBfXyj7JamLklmbc
	CSh/XA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epf0sr9p1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 09 Jun 2026 09:16:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9156ceb551eso1010379585a.2
        for <imx@lists.linux.dev>; Tue, 09 Jun 2026 02:16:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780996617; cv=none;
        d=google.com; s=arc-20240605;
        b=hdZzZEFu+8lJ3zHxuwD0eFxa4c3cCcyO4BikMmUJ2z8KoKeu74+UmM2qJ7BlSK0z4w
         w1k0viqoiY5UNGOxbfuNx5ejvhWUPvUvmz5c02hSVAwP3JP2zxwrRHfKO9qDrAuRuUbO
         Y3uGKcXKuPSIjB18WS6xYRfClfcx83dQoZ5LDm6xEac/N833NfW8jmrzULfQl/grfDwo
         6Zu7vSrm2iYe2K9b4j4e2hU7qnfNDYXjM6N4quZuZ92wW6zDQDT0k3+cZoLTByfEhOLj
         qJpHRgpfkLh1zmyPNT/6zrYyNhMZd5y3EsDTjt16yAQM7Z8Lpk25gcp1CV8v9th3Iapc
         PjLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/EqyMxiE/m94G4SRX6R7mDsxcjVfUYvMbEvBF14uWFo=;
        fh=vYEr9two5cd3xXE6CGsWKb0z2q/G1nHybSlPZjNgykk=;
        b=J9lutnenReTg2C5gCTV//nYsrdrs4ihbUqL7R7XYxiUiYhgfkxpucqI6JaMKj2zfBy
         h1wF5SX8rPCP0NHaav87fqbwAL7Uy4DCLAZiV4OqhL/TsXcdt9Fj3xJzrTW357LILkNy
         eTVGat99AiJYcdk25uu+TNoREJ5aFdhcSspjQ9ruIzEg3+yMcd6486D+tnSYLgizyAup
         MmVepMXsR0T4F3iJuBdfBnTfi043MRyC4k8XU0jBh5NgG4iGmrSoIyQtcMfjUweUhBiz
         ZIGjQWjXwd8aT4UGJTPzC4aZWT3YJW5nAJgLM3yxFipCgUE7aEfjgqBX76tKF9zqcabY
         UnZw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780996617; x=1781601417; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/EqyMxiE/m94G4SRX6R7mDsxcjVfUYvMbEvBF14uWFo=;
        b=dy0zu7bKq1ZNXSprZam9TX9GgRrrg581PAI0s0LylAmv/+cmybi3nRPcgzr0dtfdRy
         PpkRP+vOGRqr35nwUMgVbpqikhZqOJ6IkQpSMh/CK0H7Y0T9bU8HWFRcvavZjPS4wxmP
         zNZ2MsR73NoecOEp0F3xwnNjAhN823lAsf2hl772cxEblCFG18DEiiufT8bA/mK2nGHa
         qLj0cX05NXXffKRxqAOmvvY9a5N8Rtl66iFz7FLB3tA1Z5IOb0KmyoeUV0tphyddtBjT
         Fk16Gl+gguqVu8KdSeyJIdiyx12pJrlQbcbxzF5Py6YLPr4Tdn1q+kaSzHZZKV/iD5WQ
         8Ryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780996617; x=1781601417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/EqyMxiE/m94G4SRX6R7mDsxcjVfUYvMbEvBF14uWFo=;
        b=IuamzaizdiXbvyVRjD4vNZmtZvQRRA73r+T5yQ6j1O6bEV5IOY1sScCkCkBdPJPzlF
         sayyfkT8ytkf6wotggxwkolF1YG6CGJOi2GVrjC6/v8uhmTv3ahrGHK4XqhTbSIKTGhB
         3Cgca1wITe0XvwHmORgaDRYKhiirWBQxWc8/8fxsck0azxmhkkPX/B9/QMxq2ksBuUey
         WCd+25fz2dkk8+qaMVLN7zcf8UEHL572k7PZbzP1uQadhdBCrmHeUI1hOVqMoQCrrx70
         aLq6cmbVvT6XHk7wBK0P66RF+2+CMx33siq16qdjsRYuAROLB0veRrjxs6rbwn8ldQ9e
         ydmQ==
X-Forwarded-Encrypted: i=1; AFNElJ/zIJ7e/htEODIfALhUSwxwnTBK2iPq86C8ELkxjCy8t8M2xVQ8EJKfrJeknuLxIoHWDL4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwgqixrZpsN7/Us3ubnUYiJkxtxsZXSrjJHqfTpjcEzi2EQ72g/
	tvVG+Gr5yT0x79ep2jq3I/dSHR9RlmxG/ot/SLasWfMm7IlxHCLZHbixY+zEkeiR/s9bMiriGcn
	8p6IcYFWJ/Ju93aliA9zobobCsvqPppSYwmoQHiwQynaciB0O4m2c6J5Xc8+gHuU36vvG55Koy9
	JQsL9SZKMgyMecnn/yQPFd4KbOVD985Q==
X-Gm-Gg: Acq92OFlJbquBeuZwf4yAwDOdZnXj9mjiHBIukfDoKBya6i8hRbP0iso0XmrFnvFPGA
	hx+wQ1mZNjw9vSdEdbWp6duwyOIHqoc0rTDwIwOaEHlC6m1OmiVxmdu5sPFgPVUWS3iKjrmH3Zo
	kgD5VbhgBRsnaqU8HPEe7kkleHaQNf65fMF7IxQe3dCuSGn16LnzDDEojL8zxxS34BrEYAkl3qC
	aF2H70R6bEma+e05DVTuN0n+EnLhzpP0wQkUcJgyPoER/ixGG6VZI01JOUdCPtd9o8wbJYrbUo6
	0EdLeKl6TO8gA5GH79wneIrRo/Stcawvkm1XQYDLshUkVkSUPvR1Urj0YcV7
X-Received: by 2002:a05:620a:1a0a:b0:915:40ff:4e10 with SMTP id af79cd13be357-915e822bf5amr252717485a.4.1780996617397;
        Tue, 09 Jun 2026 02:16:57 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0a:b0:915:40ff:4e10 with SMTP id
 af79cd13be357-915e822bf5amr252712085a.4.1780996616898; Tue, 09 Jun 2026
 02:16:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com> <20260608-shikra-camss-review-v2-2-ca1936bf1219@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-camss-review-v2-2-ca1936bf1219@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 11:16:44 +0200
X-Gm-Features: AVVi8CcruF8G3bHCMvT-UUyCre6c8b-WOyhsQAf9gtMqJA6eGNVQ_TK2SNIM-_k
Message-ID: <CAFEp6-2V_srCT=wWFb5Pjrhq2-pzTG5QCd90Pf+0s92qC6G8LQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] dt-bindings: i2c: qcom-cci: Document Shikra compatible
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
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4NSBTYWx0ZWRfX3ot19VPv1142
 AIcUMLCm69PMuXconLA++ebwlF3wMqZQZ0lxkxDMtshnU3BKtlQn/HazTY/HJISLBey+xJ+BtoW
 3URo7h1anry9Q7g3u10NPL/yvHunRPFr+Jt12GQ7KNVy+5gMikGN3aiDjlzlrctYDTQCNM1r5lm
 OQqnwVNwBlsiSC6m/1vzPwGsDv+GXsGhIn7gZF3Zyaa/HkIkt5IsLSJQA6Hg5L6QQYI5OGbIJf+
 52oQL0zQvEfvNwL2aXrx3cmgTOxtiDNLBwKQaW4zM+HNvqCMqFwnLd8qNDsZjknTeRNQpasvbso
 C6Za37mb/Eeodxraga8McRqa1XQJhss+XjSitmdccvgNzZx+G2T+4EdSOFbfxRLdFooBJWJLoXQ
 Qm9nJIsA+qsKNgZrcJV8BG9lJYXEgTwthexisqzkuKOVxb12kZCv0l2Cng++tyg0+dVdWfDGJqY
 gOMTfqd0Bwx1EhNtVFg==
X-Proofpoint-ORIG-GUID: ZHvPZkxVQZTW9JCz7htXzzw-4S5Ogdc7
X-Proofpoint-GUID: ZHvPZkxVQZTW9JCz7htXzzw-4S5Ogdc7
X-Authority-Analysis: v=2.4 cv=GeonWwXL c=1 sm=1 tr=0 ts=6a27da0a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=LDBv8-xUAAAA:8 a=KKAkSRfTAAAA:8
 a=b40KZWPJp5KrgtGOUacA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=DZeXCJrVpAJBw65Qk4Ds:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090085

On Mon, Jun 8, 2026 at 4:07=E2=80=AFPM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
> Add Shikra compatible consistent with CAMSS CCI interfaces.
> It requires only two clocks.
>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Do=
cumentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 7c497a358e1dc8cec8b31c17bfedf315e4e00606..c94069afd8d06dbb08ddd6b49=
e2de7dc7acdc29a 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -35,6 +35,7 @@ properties:
>                - qcom,sc8280xp-cci
>                - qcom,sdm670-cci
>                - qcom,sdm845-cci
> +              - qcom,shikra-cci
>                - qcom,sm6150-cci
>                - qcom,sm6350-cci
>                - qcom,sm8250-cci
> @@ -137,6 +138,7 @@ allOf:
>                - qcom,kaanapali-cci
>                - qcom,qcm2290-cci
>                - qcom,qcs8300-cci
> +              - qcom,shikra-cci
>                - qcom,sm8750-cci
>      then:
>        properties:
>
> --
> 2.34.1
>
