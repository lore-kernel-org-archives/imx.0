Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677F845FFBB
	for <imx@lists.linux.dev>; Mon, 21 Sep 2026 09:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982189; cv=none; b=dxC3em2Dmb6HaMRnpUKMwa2huhaLJNkn21bfZZKkeDppWxFPGW5uHz6QK+D8FgsrbRVsHOmTn0u+2AmGN2XqMWClYAyOnbMYsniJnGArrNra1r+C3qNaY/jbowl6CVtKFz+cfafvvUkM3tfqL/og1w7/NWbbk9nFnZw3uiYJRCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982189; c=relaxed/simple;
	bh=gARbVD09EARrYQ4UKtDL6tThF4d9UKCxBmg0cLWL/2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FMBAujXIxoh9zw623wRjk327SBZZPTjPlDh6HkvW5ez/4geTgoiLS1Kh81GP9lE3Cp/Ur9oJC2qkQvtCsG+6dt4HsV5MluSUHTtKDcKTneP6imNHzHQUz6/3Dz8Yyu9MzknF3SPDFExiHOulcWK5OJpTsuFpTAxcm7cbT71pQxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fGRvcwqC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RJ3oTVK2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fGRvcwqC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RJ3oTVK2"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L79kIZ1458257
	for <imx@lists.linux.dev>; Mon, 21 Sep 2026 09:16:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	isR6N7oua6mI9Dmgnu3gC3e9cJewlveSIcCXH4NLuyY=; b=fGRvcwqCJZhEzECr
	FMHMTJce9NFzwUvxWQ9gGKTW3DUJEGaQ1KF0J8jMmimCE9ZT/u/lAmXKztrw+ffc
	/lIaNgUuReSay/rwbgpEy7V/gt76GmmTMWBd10wd1HKxcCz7L5EAfrf9Py7qvNck
	Pb+fYUcZnBKC++yTEitn5OptTABxkyNDs0CVaw8mqAxJ7osuvCr6lHf+H5wL2OQw
	ko38k0RtZUDBQSwnnLEyLV0wBWSssLZdIKeMF6Ht/IQJVH8TJQHYywFLsEIG6LNE
	gj/L9EeSmpDg0iFknUlOqPj0UWZ2aB0S6j019gNx4sJqhaaQWhX+HnsXHVGHP7PA
	g0CYXA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3v9msk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 21 Sep 2026 09:16:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939f925ba4eso386704585a.3
        for <imx@lists.linux.dev>; Mon, 21 Sep 2026 02:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789982185; x=1790586985; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=isR6N7oua6mI9Dmgnu3gC3e9cJewlveSIcCXH4NLuyY=;
        b=RJ3oTVK27Yh/kGuki+wa50q54Y43Qt8kzloJ3xuMWzukTLePdJsuqDKmoNkv3BJw9N
         s1wxelBR0vvByxmROS0YdkOETGY+sm9KndFUmxztuym/5j582bbCKh5nrgk7luWEi+/P
         8u1L4YbnWeoeN1+nu16aQP4Inkib3WVYGgIHkWmJ7X40kTtc7weXOU1EVabgvyKe0WCb
         AWCxdLaf5QVoRafpKD3uW/ovxIMVC4U5L2isSoYpbmE8MQ3xW/gtGy1V7fCDPStuT2A/
         f2CJh7p1meYt1LlMMeDEBrn0g27NnhD/v429zzyXT+U4NUGiw2QjnAmRcCvhEN4x8jen
         ns8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789982185; x=1790586985;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=isR6N7oua6mI9Dmgnu3gC3e9cJewlveSIcCXH4NLuyY=;
        b=iZfDCQjP0sTGfGny6FG7rXba24HPLbrjCvBqu5TRijTqXj5Y73r/URy1kNhz5mAtpM
         yDWHh4tg/IoCcwVYcUyokTLsMN60Bafw26JzfklxwGejr8YvW036PCZCK8Ybg0obDZk4
         +GnJsatM0XLHQkblRafpATqMfbhGsKtUdrKydlv5nB9/2obNmqvpYybc/WfBTcBXKRqz
         MV8MrYSeaLasSmdx8RbETvX5/WtxC9rcqbYc5wRVm0VmnSuxE2nalWEqt+LtUlxYDVy2
         wSFG5kPVWSmk9pv4jyaYokTu8tyLA+dQw5Ge/RUrcShozDR6ABRVOMEDIY9DqRLJetge
         Docg==
X-Forwarded-Encrypted: i=1; AKwUvBxVC+gTwJXjG4rAaFZb7VCGElStIMohM6aa3e6C3LVwT5lFLhYU0LVUbRtoY802H3+IIMw=@lists.linux.dev
X-Gm-Message-State: AFuF++mtPzP4XrhsYUAE+4o455D/MS0yxz118Q+A1RONpCURMiIjR730
	+BG9MPz2G05bIPeA2R7jjSkH85K++SgCnIzpRRnwKDvAKVkrvhpYM+FpfaCkX8cmkzY5gnGSXAe
	fDNAeuFn2o8VPmEabp3f4Jv5uaol7NTjzbaGIThJiqWs94BzsgaYEAsI=
X-Gm-Gg: AYBFou00Z31py++B+PJa1dH4hdhsH81kMRDZX3M1azNr8k00W/ihdI0th0lVTor1LUw
	ypFJ4sSVz6/Evmx6T8AYx03WwcX622DILJ2JUrId+0cWxvR/iD8qcsz2SAEUtfI/c1VnPq4NJG1
	LU/NWhwhIuQbzoGiEuynYYcDYxrPHgOthhmReL05cZDxt5LSwuqXMx8dLDb03Sny2yBzojJr7FL
	8mjSS4dr/sY2XKZtidUOLr6YrVUupal9mRl4SGPOrdf3GpdvuEmU2W1V7bzgihJQw4YvipExnht
	SSgWkwpe/RdD33qYHZjaBlrO4nSa8z+LBE2ZqMbLyeTmPRbXT8lVLKerLR5sNHn+29Md7hGxGwe
	qdDrAy3eW44EZjQ81VsoULw49wg==
X-Received: by 2002:a05:620a:2810:b0:939:5ba5:28c5 with SMTP id af79cd13be357-93bf5564a5fmr817540185a.17.1789982185262;
        Mon, 21 Sep 2026 02:16:25 -0700 (PDT)
X-Received: by 2002:a05:620a:2810:b0:939:5ba5:28c5 with SMTP id af79cd13be357-93bf5564a5fmr817538385a.17.1789982184876;
        Mon, 21 Sep 2026 02:16:24 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487243cede9sm23544040f8f.0.2026.09.21.02.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:16:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Mehmet Fide <mehmet.fide@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Haibo Chen <haibo.chen@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: Re: (subset) [PATCH v6 0/4] gpio: mmio: report the line direction on chips without direction registers
Date: Mon, 21 Sep 2026 11:16:21 +0200
Message-ID: <178998209530.39208.11869939955617063502.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915080501.329424-1-mehmet.fide@gmail.com>
References: <20260915080501.329424-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ytia1IYX c=1 sm=1 tr=0 ts=6ab0f5ea cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=anw-P6zLAAAA:8 a=EUspDBNiAAAA:8 a=niCvQgg7AacVuODDKsUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=7_zPmhNiJtJTypZd5sO0:22
X-Proofpoint-ORIG-GUID: TkLzjUAsSSLA8GSbozUK09Nr8w3OgEbT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEzMSBTYWx0ZWRfXzjyz+lM/Kzo1
 PNFmeJtfo4DOA8O2AGJYcEFG5R90nF4Lg5ElmEqjTOBgSB0c7uI8YS8UMyxaixqtOpAqCa+48zF
 IBX1gax8vs8WhE1uRNcmBYnblhJpPOY=
X-Proofpoint-GUID: TkLzjUAsSSLA8GSbozUK09Nr8w3OgEbT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEzMSBTYWx0ZWRfX0zK8u9bIfalv
 0W32G8p3QxtxwzxA7HBSRV/4SvYNR78h+ZhMu07OAJz9AZ8AhhJe7wW56Kd8qRHivM0uJk6tnGH
 SkysDVH7Zu45nrymQy5+u3H78bwd7+RHQ+yWtsXwKbueydrRtdkWse6g+mWSdGBARbvkH2IUPC/
 omL3YfZr3Equ4Ih1D4Ib5zc0V0q13s2avPyC7dY9/g4TrpwIvhkrN+1WVPbBnt2A+n8p114/NSf
 oQcylNHKFyw5LSDNidVT3h/aZCROsZJA4jGdObq0H5OubunsF/5oyGNgIrvtnnl5KDUo+yUz//k
 00Yxa1ru93/GA+FoU44kvDiS/IJ09BzbQEYQaNYbq9x6hQvRQNB5H+J17uerpf9Bc89lTBnDIne
 vO4sJvHeCWk6/YdOiTfeYGWv4KtZaFK0IoONHmygUfS9o4KYUM/e6HbWcixr+a6jnDAB0UkVPZv
 Uz9nHMwnWzsBTc7hMyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210131


On Tue, 15 Sep 2026 10:04:57 +0200, Mehmet Fide wrote:
> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
> 
> Hi Bartosz, Linus,
> 
> this replaces the gpiolib guard patch [1], along the lines Bartosz
> suggested there: instead of teaching gpiod_get_direction() to stay quiet
> when a chip has no get_direction(), give gpio-mmio one and let the pin
> controller tell it what the pad does.
> 
> [...]

Applied, thanks!

[3/4] gpiolib: add get_config() and gpiochip_generic_get_config()
      https://git.kernel.org/brgl/c/fc291104d01a4e42b44132925c46655d4be5ed13
[4/4] gpio: mmio: track the direction of chips without direction registers
      https://git.kernel.org/brgl/c/b5c26686305e070ecb8a4af3acbc4aa92266029e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
