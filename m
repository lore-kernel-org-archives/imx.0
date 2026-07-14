Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BD71CDFCA
	for <imx@lists.linux.dev>; Tue, 14 Jul 2026 13:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034982; cv=pass; b=qpt31JIF1tjGo7EG3bPlg0oBq5e6muk4+p0pdtjfaV7e+au5i6jCVItlQ8LqtCMa/gN+5s2c7TN0vPM522RLGzQLkZaKfZJOoDCbT/9UbDRCuf6q6dpo6QR7vEcCTAYW3JU5GAuIlE8SVdq21389Fr+Gk6HPt9cM2cENLHCiFA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034982; c=relaxed/simple;
	bh=Jd5DJDKksYD7YmBkR0dFjXMUrqs3kGnAsls6yHowXHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=taPQcZf79NhfIfN4wSKOTEV2xVVXMHlkoiDNBYzxUlL/YHb6zlFOB1S2rtibD4I71hy8RQxOMoKOiZFYZ4qlxeBFiiht6u6xr+fsHl/qjlC1SOIDL+na1o2/7nRHQZbPyewgk/+Eq7pSlQXefQBxzky/oqOMSQjS03azShqvhfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jeDP1noV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CrkpA3b+; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jeDP1noV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CrkpA3b+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ED4EEl457350
	for <imx@lists.linux.dev>; Tue, 14 Jul 2026 13:16:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jd5DJDKksYD7YmBkR0dFjXMUrqs3kGnAsls6yHowXHA=; b=jeDP1noVY97TJJm4
	cIhajSXeAsAmHOxUZ5w+rrnFsmDqOKfN4qv1NciKwvl0a9vv59ESqt6/YuJgOXKd
	2U4f3xsKnro776B5eQXUkzzonn9zUj4EjUY0CcmNrVrEgX1hsU92QRCgcXc88Zk4
	AtF76m99A0GiWR0qvmuA/OQHihEj2e1+CtLRE0wEH12PxEsaH+fBoJe1xohiHUcX
	R229DzrrEXb5VIR1CijlNq+5VjsfmV0mgJza7rCEwLCI9oqIAHjuyOO3YurOejU1
	OXk05tjGT7idOG9xzgxgye2BrDtcmOkjjdNsDeOVdRx43SKY0RtvrJ1yvDvre5qj
	UD2uKw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnp0g2gb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 14 Jul 2026 13:16:20 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90410c668adso67578566d6.1
        for <imx@lists.linux.dev>; Tue, 14 Jul 2026 06:16:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784034980; cv=none;
        d=google.com; s=arc-20260327;
        b=kl0UrWwP7T7wAFrG+hPWMeQydsW5NuFpck3Y+vrwullZHgoqk/OAL6ETSnk8TrmitF
         ZA4u2pP3rhQbsXU/dgZtUv5TTnnm03dYQdRfxE6P3TGqTcRBejL4U1imz6cwpuziUIdr
         i58LDwZ9UcIUjntNyGAET4wanBjJ7Da7fwu2GV1CfXcyZi0Ydu0/i8fXOYPI83sUDbbv
         66+jAZ13/meopSsDhWFiJUjGdOabuNjAtZdtZEEtWdw4gr8XXln+LULUr9JNRAHEUR9I
         mUOtWzjXy3AXzEZUZcEfv4V9wsgPqeV1wKmSCJkib3BjtGPgtQp4dJRITTAzUbM+EQFn
         aZ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jd5DJDKksYD7YmBkR0dFjXMUrqs3kGnAsls6yHowXHA=;
        fh=/AhWQYyLO240ri5sV/m1RC56NLVNsG8+C8S1bqLEyMM=;
        b=neZ0Jx34nNmA26TkcTwzJx290/WSGUI2+5SgDqQRFL4DiCJIs3Hf0Rgui2cBLn91H8
         N/RiVYoCMQgJfK4OSTiJ2yIeLsIAVl5pi7CT2yso9siBE19U6/LnrtFAXPlnffi8dslW
         mPA+B4IqjBxBct9pOvmsePkvrf8Nihml3Y0CMNnnTdqpuad6IdXVesBDyuxlxsoQoXFx
         NQtC6hISS3b2M9Dou4C87Li3qk3gSYiR56GDH2ZgZUqCL9VfPFgzQLTZc2IeINab5Fs6
         PpDwtKjQDkJiTglr8eKpZwfUW8oZ36pOrYfLHIbfSI1sgXApEszBB1bTjGx3EwIW3In9
         hxmQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784034980; x=1784639780; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jd5DJDKksYD7YmBkR0dFjXMUrqs3kGnAsls6yHowXHA=;
        b=CrkpA3b+zdlUToopAdhPUY7xv1oQhf8srllJPD9TW+j+vUYDcMIphoSDqpH0OwxUqh
         OKZcal45omih/RiyUW8dE2DjSHMvvKUO8Ff0X+g7fzv5XY/U7B1GVs2AQjr9pBArWw4G
         8RxTlPBlPAFkvfPP4kgkecjNpI0vkYVTJwa72fQTkd/s67uohMQ8/2lzNoSWrZJVfDjp
         IJmHxWz0heHCj2PKU91Fy7uUg1CJb5e0xfK6C8KcKjzyo7qBeNrP/KGgrdScDHHrpA7Q
         vp2Wk6F0/MpSnab3vUtjUpWYyvJDdK7I339RJEqj6uVg6tDoX+Od9ujf8CC5PBlrphyo
         Uc8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034980; x=1784639780;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jd5DJDKksYD7YmBkR0dFjXMUrqs3kGnAsls6yHowXHA=;
        b=iz188QfFvv1uPhkPh4aVfg+h3cqAO407jEbwayD0YmOhSA/C2rLiOF+go1WkaExx0B
         b0L4ObKroWMnU0RzY4OH1t9eA+mtUIQ/28I2gv/Vvk3BT/5ouZZ/cZJA8QpVn5febyie
         7bxdY8b8oGZVOwr0l18AUjDN/wEYWsIA0HtdpnggYqmM98dov0FTSno/wd8C31pLsg21
         hF/5ZqOxxxypp4Gz+9u7ul0F0LqnFN25mtL21F8Yp+t0MEmdG0ni6/FNZ1Jbp3+ScpBS
         Iie0fDzD6FxpSn/fJg9L+QLSTQzln0AO6mbi4NaUwKqvuIlUto39PNYLS0JXsZWviYcp
         COhw==
X-Forwarded-Encrypted: i=1; AHgh+RpohPOkuNUX7ysmcN2fmnzgNxK4i2EbiHNeUd/xEhyLqxNsstv3DGDXLiUmYDEDMjScc04=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1ZzbGf1Mil4zOLjuLQUkD9YyReO02aIfCAC4kEh/wBF6RJaDf
	L9GJk0055a2wBbn4ccfSa0C9G/SSOPET0ajvTSfzOj1u3cyP2Amv6TkOtpT78SoZGUUYcFDcbX0
	71tzzFJBQ241Xiw3uiwrdzb/7XNiQk4bkSw52PQIoUagXfRxdgIQWjyfRANGqTzk4sUmPClYDMW
	GuKSlqIjufW0P7dHwR8RE8cj4G/moN2Q==
X-Gm-Gg: AfdE7ckDPp4RKnEIknVenf9YNvE7x8LiadpUOMjzZlRaRGdyu0TM0H8de1Q68xjaPLx
	xnCEPSs2EpqrFeRqzt3Fw7n2c9tn9Aexz/3nX9s7x9aj602qsiEZoLRHzDYb/BLIzniZvytZZfs
	ix/8Ib7iGe6O9Kuh7CEgR44dAvDMrMZ0jQkaCwuRSrjnHReQ2oks2IM57l8ykTSgbBfwbk
X-Received: by 2002:a05:6214:2689:b0:8f2:67bb:a37d with SMTP id 6a1803df08f44-90747d19fb5mr45880476d6.57.1784034979505;
        Tue, 14 Jul 2026 06:16:19 -0700 (PDT)
X-Received: by 2002:a05:6214:2689:b0:8f2:67bb:a37d with SMTP id
 6a1803df08f44-90747d19fb5mr45879656d6.57.1784034978901; Tue, 14 Jul 2026
 06:16:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <d7f7e8c9589d937b60e43168845ab4fda15037a3.1783603600.git.michal.simek@amd.com>
 <ak_Eu_eQKalPMwo-@pluto>
In-Reply-To: <ak_Eu_eQKalPMwo-@pluto>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 15:16:07 +0200
X-Gm-Features: AUfX_mxKzpq6RPl9OYBnCrjfKgjOcnNPKcB_AjUZghzaf78uP1r8iO8ekjIwd1s
Message-ID: <CAPx+jO9KMcxnmt-wT5jaApj9p7s11B6eSG6K08Jt9J=-vXxjhA@mail.gmail.com>
Subject: Re: [RFC PATCH] firmware: scmi: Make SCMI arch independent
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org,
        monstr@monstr.eu, git@amd.com, vincent.guittot@linaro.org,
        Souvik.Chakravarty@arm.com, Alex Shi <alexs@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Brian Masney <bmasney@redhat.com>,
        David Lechner <dlechner@baylibre.com>,
        Dongliang Mu <dzm91@hust.edu.cn>, Fabio Estevam <festevam@gmail.com>,
        Frank Li <Frank.Li@nxp.com>, Guenter Roeck <linux@roeck-us.net>,
        Jonathan Cameron <jic23@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Len Brown <lenb@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linusw@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
        Pavel Machek <pavel@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Yanteng Si <si.yanteng@linux.dev>, arm-scmi@vger.kernel.org,
        "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
        linux-arm-kernel@lists.infradead.org,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
        "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
        "open list:ENERGY MODEL" <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzOCBTYWx0ZWRfX4AZIz4bxEU6E
 MIrZWSoOGvtg/+SSR5xr5Sd8T2xDigoaanxs9bySXTplY5EQZJAecwYXGG/MUEL8iLjwQ0XaHad
 1oViZzDpDWj9NinqkqjHHLkDOTR1/EA=
X-Proofpoint-GUID: BIskOom51FyS1jQVSL5jFCCoE36upLap
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzOCBTYWx0ZWRfX/o+iYlx6LiSu
 7LO3cgmiyv+r3+CxuH9NoGPEIROW8j9GQJssvR7XONS6SGs/OkC88cZA0BIpMX0DIYy4lTzGuZE
 xRWxgUJ1DYGiZNVwGpJgLmlRf/sSgLzhm+qG0tP4XPDdPJmiTIQAuUb0536KWDOMOrTE3GXu/RH
 wj8J9cfXdttnCZZfHZFlSlm8d6WX8sLkUX2yOzLBopPiaqQk1yR//aMVpeZPpYX9JRISHVFMF+3
 9V4mYOPbUKMZ6ol54iivqxO6YNDJTkYbBYv9TPQWz324mh/8giw4uWwTQ1Hq1rvzLFZW4MD1g4X
 lB4neVZgEcXIqg3aUcoXE/3pNRNa48y+uJHuW7i4AZxHXUSVNb6DdIXswTy3Y71QyTOef8qhxQM
 gpYd6RZbgrrbM1H5A6BwSA1PaEi3gS0OHQGVf0fYNtL2Y4lWj3CVNqiOaMrCSAhRasd2abEjjmz
 FVvR5udwwZGEyiNH6qA==
X-Authority-Analysis: v=2.4 cv=FtM1OWrq c=1 sm=1 tr=0 ts=6a5636a4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=7CQSdrXTAAAA:8 a=K75D1l0-MnsISjLg7T4A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: BIskOom51FyS1jQVSL5jFCCoE36upLap
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140138

On Thu, Jul 9, 2026 at 5:56=E2=80=AFPM Cristian Marussi
<cristian.marussi@arm.com> wrote:
>
> On Thu, Jul 09, 2026 at 03:27:00PM +0200, Michal Simek wrote:
> > On heterogenious systems like AMD/Xilinx FPGA there is a need to talk t=
o
> > SCMI server from different architectures than ARM that's why remove
> > ARM/ARM64 Kconfig dependency with also remove ARM from description and
> > rename folder to reflect it.
>
> While I understand dropping the dependency on ARM (I always wanted to do
> that and test if it worked at all on some otehr archs with QEMU), I am
> not sure about the whole renaming party ? why is needed just for
> cosmetic reasons ? it is at the end an arm originated protocol so I dont
> see it as a being wrong to be named as such even though used by other
> archs...I have not really strong opinion on this...

This is certainly not my call to make, but I have to admit that I
fully agree with the above.

Usually we don't rename files that indicate a legacy platform name,
just because a new company/platform wants to make use of it.

>
> ... my concern really is ... wont this full scale rename simply generate
> a lot of un-needed churn for future fixes and/or backporting ?

We have some git magic to overcome most of these problems, but it's
not always straightforward, I think.

>
> Thanks,
> Cristian

Kind regards
Uffe
