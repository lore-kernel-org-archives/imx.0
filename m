Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641203612FB
	for <imx@lists.linux.dev>; Fri, 16 Jan 2026 10:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768561199; cv=none; b=cwvQmOdksRETSo3x3PQtQt+4L1GViGF6ytJvjpaNjI0dyqb2OLChAxjzoj21ZjH+8ha27fgHID2tX0IpQEfNHpSYosN69Nmyt1PRD8jHupoepTpVL+94Y8vHgX40Ay97jBbCuoVP9Z3QMOWP1xaDK6B3ai7Snl94DMlVxJtHjT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768561199; c=relaxed/simple;
	bh=bUco4N1M7It+4JUQORbZ61sanRZKijYO39C7SFRFjpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TPhN18JCWEswsfK516hTSGw0xrQBYD6P6FsN6mGWKjQ0hY91jSCP3nHDuzXSEwow4JxT8y0/n1wxOHfc3WaHke3bRJm6KLf6bmcDHRw5PbQVYN11xLRx3+hQwlJkLtZihsS8wY6JOm3EneDNpVFu2AdQcWKbWFKvAXM3X4AXXdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GzcbB5Ud; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d9aH0nbS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GzcbB5Ud";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d9aH0nbS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G9iK9J006940
	for <imx@lists.linux.dev>; Fri, 16 Jan 2026 10:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hXYF/SU0x0cq4kg0To9gqp3URoD3jz2g2zAKZXrW05Y=; b=GzcbB5Ud3p+q+RYr
	8G9E3u4YpMb2z9On800o+85X5W5g4CuhgZ1c1PEWHZWLS+eu1bW0Yu4drjWY4Hai
	oCsJIzXRMPk8pYD5oyyFNZC6QndmUtiGX/QZh32psjqlmZnExXYwQlHkLae0MlqL
	7pzRLa83c/+wgl6IsHuT3nABhshR2hMUYGtJvBUkJtM3p1P8KOErIK/m+bRc5HP1
	GD8XOt/+9N7k8R7A778FVdinVLEWDfF6dvIewz/+2cX4ToEOE97nl50gpHeFC4oG
	I5UDoz8wJsOTr6FujHgGupLf8V0KGhWpkAfb5+5ImLxuY1bmV71IaFZnStCU/gUH
	Sa4+YA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqjy9r769-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 16 Jan 2026 10:59:56 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-45c840f19f4so3767431b6e.3
        for <imx@lists.linux.dev>; Fri, 16 Jan 2026 02:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768561196; x=1769165996; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXYF/SU0x0cq4kg0To9gqp3URoD3jz2g2zAKZXrW05Y=;
        b=d9aH0nbSNMzP0za1BSdofDmdrnMfKOYoJLWWZs3M2x6yHEFdL6PhbgPqnykZTnCETS
         SZUqGGvVdW9c4IQuMQVc/lMps4f7WnYK+bguZ7wYdOE4HPJ7zqFD0jGl0pVaIfuH5YDm
         WgeY3tcA8827PXXhvJpxYKvHtOORLYoY5Xu3D6NEJihBOnaOVzBsVjmncc4uWIcx77x9
         0DQ0hmXmo7CjgBzE7086NvPG9/bDy9f3Y3wziPF8fooAt97TsF1WMynHK9gaJiROqNpz
         IvArrt4CWHzBGTrYXZLoww8JTqfgfX2Jti1VfHILn9+ijAAFaD7g4+z/LvzPEV1/jylr
         FZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768561196; x=1769165996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hXYF/SU0x0cq4kg0To9gqp3URoD3jz2g2zAKZXrW05Y=;
        b=cnFhmE1QyhscKfb020f+OlsOrG6z9sWHv1s2fJZROIw8HCursW1E7cQR9AqpJxstAP
         PM+E1a9MtAoZrCyIvXirkmbyoEyt6cadR+bFkJCehxM9aYVjGRjdR5Z2OT73TXLgxxm9
         x1Qjkeeihu+xBthM9zLTO0SjeKsBIaGeGw8BAueWm4Ez1Zdw/p4tEs5i4hsu5PGpTvdU
         fvGUYDvO8MLQkaDRqYPYoME1xHG6rRhsr0IGoRoL7DXeG41DJBrUflcX/ACqD3TjrxrY
         OzREQdsVqncASbZY45GUhmd1u0lf3S4prUg8SrAUi049cSxa9VUtF1D8R42Kxbfif4Jy
         7d6g==
X-Forwarded-Encrypted: i=1; AJvYcCX+ItcSousbILPN1lThE6WkBUY3No0x2kAR44enjSXmj8Ep7e9Oc6FnhCRmrPgTVKBpIMo=@lists.linux.dev
X-Gm-Message-State: AOJu0YymwtpP5FrheDU3llAV+3dIF6WGIqKXWT/m8yNb7uyjcp/KkMfT
	I8PukboIiiK1gsA6gVXnvsZx48ni+OwrsliWDV80DJMw0dZOrKe4zYjo5QjvnC9Rlfi+UYZ+zEE
	QucxzN02XltIhStfZ1S9sHEC0HSv0PFqrWQTFNwP7/0VFKEaW+0/kWoGMxCfdZ9a+N4wSP1wYxX
	xxPuDLVpjbx8/GpNkrCsrW6sYC4tgVjw==
X-Gm-Gg: AY/fxX6M3hf5TKQujp8yu/k2Nq5ruI7hW+0y2wwJa/jfg1/k4ZnpvWi2LvgOaMqaymv
	s6cOrak/hE838dgRlabmlM9jmjiPGbdTS78Rh0zuYpMRSyTMW0AbiJ83M0HrNAXok/1OwTb0DrC
	Q4qoSmxCUQm73cnh0iEczAbldWb8O9gzaHEEl+5zgq0xpD5MzCeOzyEF0/gH//n2ra7vLU81Fiy
	J3HxiI2FUbdiRW4PPeSXKkkmXC8SZoyqCWJpLrszl1D8Ak1aEX7UEBu
X-Received: by 2002:a05:6820:4410:b0:65f:69f7:d0e3 with SMTP id 006d021491bc7-661189e5644mr616431eaf.84.1768561195676;
        Fri, 16 Jan 2026 02:59:55 -0800 (PST)
X-Received: by 2002:a05:6820:4410:b0:65f:69f7:d0e3 with SMTP id
 006d021491bc7-661189e5644mr616407eaf.84.1768561195190; Fri, 16 Jan 2026
 02:59:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
 <20260115-sm6150_evk-v3-2-81526dd15543@oss.qualcomm.com> <20260116-malachite-spaniel-of-refinement-af22ae@quoll>
 <025cefd3-888b-4744-bde3-2d5c007db66f@oss.qualcomm.com>
In-Reply-To: <025cefd3-888b-4744-bde3-2d5c007db66f@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 11:59:43 +0100
X-Gm-Features: AZwV_QiWfPjW_f8oYcCD8lMx6vbrDji93S-M42fv7xecvQpuV1cj3bM6NcGZ2oQ
Message-ID: <CAFEp6-0nVaq2qEoyBuAUpEQZ8Xm8ENJu2QAEFbC0h6XX5JmmoQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: i2c: qcom-cci: Document sm6150 compatible
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
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
X-Proofpoint-GUID: oFkEs9UGSNJhH4wuhQI8nXcDrvwW2syf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA4MCBTYWx0ZWRfXyQ526OtD1kGq
 2rpTPDlB+tty4x2/e2PkPdu90cna6pKNJzz56swxd7HfhiBwHM8Pm/j2/cYA3a+2R810y7S91Dx
 tsuINyLyVLR4kMslfLQ1X1iLa6g2QxrDd+yO03WaSzcSRxvjGG5hFdGfnWy5A2oy4f9ZJ93KRCe
 weOObr8Nsv2jA1w9G4DCeBE7+VDuJUyAfV7n2FZIUKzyI4bHLm0uj7svlQzxsLQEG9tweoP7h/p
 LKm6fwpKAsbHsQ9eZTwj3E/y37zwSMWEg8sHx169d7tFnxkYFIK4yup1p4AaG6AiL1pJ2QXDuUl
 cfNI+otkrTlvA7q7vZSSzL0MN09FgsSoBYTWQ5GwqlKvXB/rgEHyK64sDsMUXkvvVkE2RH9KxIn
 mm9t+WTsYVOOU0uwIUNxJbLCF3VHpWYojJuTt1rH5AVabcy6VTh3Zdop0PCmP+c3gvttI4AFDt2
 xrnoYcuHBLD9eVBf+UA==
X-Authority-Analysis: v=2.4 cv=OJIqHCaB c=1 sm=1 tr=0 ts=696a1a2c cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=Oz61Ga8zfdW3iksW4uwA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: oFkEs9UGSNJhH4wuhQI8nXcDrvwW2syf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160080

On Fri, Jan 16, 2026 at 9:34=E2=80=AFAM Wenmeng Liu
<wenmeng.liu@oss.qualcomm.com> wrote:
>
>
>
> On 1/16/2026 4:28 PM, Krzysztof Kozlowski wrote:
> > On Thu, Jan 15, 2026 at 06:12:38PM +0800, Wenmeng Liu wrote:
> >> Add the sm6150 CCI device string compatible.
> >>
> >> SM6150 include three clock:
> >> bus: Bus clock responsible for data transfer.
> >> iface: Interface clock responsible for register read and write.
> >> cci: Clock for CCI core operations.
> >>
> >> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> >> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> >> ---
> >>   .../devicetree/bindings/i2c/qcom,i2c-cci.yaml          | 18 ++++++++=
++++++++++
> >>   1 file changed, 18 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b=
/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> >> index a3fe1eea6aece9685674feaa5ec53765c1ce23d8..3472670fdc908ef8f3b3af=
c68ff437c0435b69a7 100644
> >> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> >> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> >> @@ -33,6 +33,7 @@ properties:
> >>                 - qcom,sc8280xp-cci
> >>                 - qcom,sdm670-cci
> >>                 - qcom,sdm845-cci
> >> +              - qcom,sm6150-cci
> >>                 - qcom,sm6350-cci
> >>                 - qcom,sm8250-cci
> >>                 - qcom,sm8450-cci
> >> @@ -263,6 +264,23 @@ allOf:
> >>               - const: cpas_ahb
> >>               - const: cci
> >>
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            enum:
> >> +              - qcom,sm6150-cci
> >> +    then:
> >> +      properties:
> >> +        clocks:
> >> +          minItems: 3
> >> +          maxItems: 3
> >> +        clock-names:
> >> +          items:
> >> +            - const: bus
> >> +            - const: iface
> >> +            - const: cci
> >
> > So basically the same as camnoc_axi+cpas_ahb+cci, so just put it into
> > existing enum with qcom,sm8550-cci.
> >
> > I asked for this at v1.
> > https://lore.kernel.org/all/43efa6fd-53c3-4680-8aca-7b37089ca295@kernel=
.org/
> >
> >
> > Best regards,
> > Krzysztof
> >
> I raised this question in the previous version.
> And got reply as:
>
>
> ---
> me:
>
> +                       clocks =3D <&camcc CAM_CC_SOC_AHB_CLK>,
> +                                <&camcc CAM_CC_CPAS_AHB_CLK>,
> +                                <&camcc CAM_CC_CCI_CLK>;
> +                       clock-names =3D "camnoc_axi",
> +                                     "cpas_ahb",
> +                                     "cci";
>
>
>          clocks =3D <&camcc CAM_CC_SOC_AHB_CLK>,
>          clock-names =3D "camnoc_axi";
>
> If this is acceptable, I will update it this way in the next version.
> ---
> Loic:
>
> No, the idea is to name the clock from the device=E2=80=99s perspective.
> For example, from the CCI perspective, you typically have:
> - A core clock, clocking the logic, which could be named 'core' (but
> 'cci' here is ok)
> - Clocks related to the bus interfaces (such as AHB or AXI), which
> could be named 'iface...' or 'bus...'.
>
> This approach clearly identifies the role of each clock and keeps
> naming consistent, without depending on where the clock originates or
> its source name.
>
>  From that standpoint, some of the existing bus clock names defined in
> qcom,i2c-cci.yaml are not ideal. You can find better naming in bindings
> like qcom,i2c-qup.yaml or qcom,i2c-geni-qcom.yaml.
> ---
>
>
>          clocks =3D <&camcc CAM_CC_SOC_AHB_CLK>,
>          clock-names =3D "camnoc_axi";
>
> so is this acceptable?

My answer was mostly meant to expand on Krzysztof=E2=80=99s point about clo=
ck
naming, but it probably ended up adding more confusion. Unfortunately,
we originally picked some poor clock names, such as camnoc_axi.

So, if you need to introduce new bindings, you should avoid repeating
this pattern. I initially thought you were introducing a new clock set,
but apparently your device can match an already existing one.

In that case, camnoc_axi should simply be treated as a generic bus
clock rather than taken literally, since it is clearly not AXI in this
context.

Regards,
Loic
