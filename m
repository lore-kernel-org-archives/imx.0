Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919B428C5A3
	for <imx@lists.linux.dev>; Thu, 10 Apr 2025 14:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744294488; cv=none; b=jwu4kQr1BHNCIzOh+hQi8guk11zP+xffIyoWFnOLvQgwgSVBCQcDA/Y+hC1JuWd94BdJDcXO/LteGOMzT+CYToTO9kq/IYNhD1DdbhKVgkqYsZmoR6iiCpGS1onksxAOtew6s7zJLLtmL0+fYtxjyw7ZtRbiqhMVkoRrkJjBJus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744294488; c=relaxed/simple;
	bh=/a22J1PdwJqbn/QFUWSNHBq5FSecHjoNqHxiEakt3vM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j8+Z/aRyxuYrj0PiW0Y3OTZQA49l8J4LXb/HIjFailrmR7ih9KyQDq24aclkgfN+CpizX9J2KS2j0i2NL3viiX3OyTdkElKIMK0pFkngUNVb9xeesShC+CmQwfR40FzgrgOz+FG6/81CrV+U//V0L6Pu+QY1YRfF9OluIIPcl3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lDYgMBzw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDYgMBzw"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AD2gAe006844
	for <imx@lists.linux.dev>; Thu, 10 Apr 2025 14:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lce32oQFI++V3gENrPxZvYwnMyyQQciO4ddTSjTvVl0=; b=lDYgMBzwKpT1YVaz
	xm0sOkM7l45gCSzaGWlGsWQnVNvhsMVEU9EzjnmJj1GrlO9lLX75+txKmnnR8yvV
	QPdmMrqOnyFsDGZIlfXpmHXNdNwHE1n6o1hktO31mN14OXVRmgmmK2WdgBmX1Dx9
	zLFK4xH+COoRGZSbxMt4J6eIIUcCPukrfRadomkV6e2djegPrX1wfA1CBKmjTQuP
	dlWbK7VHTrWR+wYMHZqZwKiNVMRhTvfesH9nmQ54G+DzhCMIife+5uaqxTk0tFyb
	Y996FvTZfPMiI6+gM89KPLnbW1SzU5fH7mQQU8AvfgGR52P7bLsjetfOnWpO7bwR
	jFZ0Vg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45xeh3g6cg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 10 Apr 2025 14:14:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5f7210995so163617385a.1
        for <imx@lists.linux.dev>; Thu, 10 Apr 2025 07:14:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744294483; x=1744899283;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lce32oQFI++V3gENrPxZvYwnMyyQQciO4ddTSjTvVl0=;
        b=Q5azeGI7yW0i9oZ/CZSkCk+ah2sBehUcJEAaHXCZt5u8mkjhqvPyzZDFQgTbx32xv5
         SLHs/DxTSuPbP/jZu/LE8u/ygJo8p0gBtO80Z1CSnrgFQWcDgrYuGh1sfcItntHBZxgF
         o2/Qz20U13c4X8/qoTjUqrmO0ZQ2m1C4/kY7zYJ/8WMZqO4OVl7hcXfwIeoDTWA5Wrlu
         6lxsJhhMrucX31I+cxu/2IGQ0J/qad6IUwNGCB8aYCbzX36sPPDDQxnusf+Q0jrxt/zs
         08+BIHzXYVXraa0JoGMS+OcMpohmflt795C3s7A6sCLmfq7DzqWGj2svChRBKVYqgy2e
         kGdw==
X-Forwarded-Encrypted: i=1; AJvYcCWfnnY01ZVyXOv1UxZ/yxBJ+s50Tbtjej75kTqXv07BbACZkKN8jT7656kcp07icu/Z1mE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5UxvYvcnC5fdxfD10yhPIsVOTQelTNbyMlqKHhCW5DzWJFKZU
	61m4sAaGcbdGbAGWsgPo1HylBGoKk+BLk3h5ZxiuULkCIO/0HdATRDahwpW6B8otvHRz8cVmPsP
	P3dsqjT2paQZqWfXoBgh87aOZC4l/FlDHbemXppi7M5Fz0P7Ic5U=
X-Gm-Gg: ASbGncvmrPyiGkMqe1OqHYSHGK19KE0RyN3vtuCVZxgh2bqnRNVw9Mchc6BE3ai6NQq
	TFk8lhV2mY3cT1eHRoCDz5t2BbNNREMfVhJHqPp5ap/YBm8pxhayCLnIG+JHbv43Proob6j3rx4
	T8YT4lPgMLVWxKMCTZgcLfpDmJQO2Ul70FjOCzlc3FNioZ1oj0XUAtmck7MlBB2TgavQ17QtHWF
	gVYkUJnlDhY0RxyNiqgLetTTOrHMk4IJUB46kGGMyEJiyN9afaYKXd3WcRLipzYP0eoSNdYWL/N
	WIYZSeUDV/4FuhNkhhy6XdPkzTSua22O7KFrAN+IePw0P5WdXESYjT+CSJAc/D+5unaghw04xIY
	=
X-Received: by 2002:a05:620a:4712:b0:7c5:a542:10a with SMTP id af79cd13be357-7c7a76604bamr427410685a.10.1744294483354;
        Thu, 10 Apr 2025 07:14:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlKeQtmurcUxSJLFNFsvzgIOZksryqV0lZXDe/Ak1oGKqZ5es+suN57szXtRFNrahXiCUAjg==
X-Received: by 2002:a05:620a:4712:b0:7c5:a542:10a with SMTP id af79cd13be357-7c7a76604bamr427403385a.10.1744294482871;
        Thu, 10 Apr 2025 07:14:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465d4ebbsm5156621fa.73.2025.04.10.07.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 07:14:42 -0700 (PDT)
Date: Thu, 10 Apr 2025 17:14:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
        Conor Dooley <conor@kernel.org>, linux-rockchip@lists.infradead.org,
        Daniel Machon <daniel.machon@microchip.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, UNGLinuxDriver@microchip.com,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>, linux-sunxi@lists.linux.dev,
        Liviu Dudau <liviu.dudau@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        linux-renesas-soc@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Viresh Kumar <vireshk@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        zhouyanjie@wanyeetech.com, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Heiko Stuebner <heiko@sntech.de>,
        Jernej Skrabec <jernej.skrabec@gmail.com>, linux-pm@vger.kernel.org,
        linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
        linux-mips@vger.kernel.org, imx@lists.linux.dev,
        Samuel Holland <samuel@sholland.org>,
        Sudeep Holla <sudeep.holla@arm.com>, Nishanth Menon <nm@ti.com>,
        devicetree@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-arm-msm@vger.kernel.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        linux-amlogic@lists.infradead.org,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 14/19] dt-bindings: arm/cpus: Add schemas for
 "enable-method" dependencies
Message-ID: <nmqw3wbmltbji4cwtifjbxkfm4uprwqvp2vdovnzueay7r26ml@eimrqf54mb34>
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-14-076be7171a85@kernel.org>
 <174377856145.1313232.11316769002552655294.robh@kernel.org>
 <CAL_JsqKiduJBRBuRS364_bSjEfC_cvgyicZX1BwvNyb1+GVc3w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqKiduJBRBuRS364_bSjEfC_cvgyicZX1BwvNyb1+GVc3w@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=VbH3PEp9 c=1 sm=1 tr=0 ts=67f7d254 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=lInoRNGhrZE9hIAi3NoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: EMjTuW8KY_aZhgiaYpprR4GpR2csb0XW
X-Proofpoint-ORIG-GUID: EMjTuW8KY_aZhgiaYpprR4GpR2csb0XW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 mlxlogscore=676 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100103

On Thu, Apr 10, 2025 at 09:11:22AM -0500, Rob Herring wrote:
> On Fri, Apr 4, 2025 at 9:56 AM Rob Herring (Arm) <robh@kernel.org> wrote:
> >
> >
> > On Thu, 03 Apr 2025 21:59:35 -0500, Rob Herring (Arm) wrote:
> > > Replace the prose for properties dependent on specific "enable-method"
> > > values with schemas defining the same requirements.
> > >
> > > Both "qcom,acc" and "qcom,saw" properties appear to be required for any
> > > of the Qualcomm enable-method values, so the schema is a bit simpler
> > > than what the text said. The references to arm/msm/qcom,saw2.txt and
> > > arm/msm/qcom,kpss-acc.txt are out of date, so just drop them.
> > >
> > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > ---
> > >  Documentation/devicetree/bindings/arm/cpus.yaml | 82 +++++++++++++++----------
> > >  1 file changed, 49 insertions(+), 33 deletions(-)
> > >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.example.dtb: cpu@0: 'qcom,acc' is a required property
> >         from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
> 
> Any Qcom folks want to tell me whether both qcom,acc and qcom,saw are
> required or not? All the actual users have both.

Yes, as far as I remember.

-- 
With best wishes
Dmitry
