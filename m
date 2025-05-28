Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D150B21CC47
	for <imx@lists.linux.dev>; Wed, 28 May 2025 19:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748460221; cv=none; b=TXz4XseiDXBsOPr7LBUHY61QUy6OYL6oalDeIo5NMjZW/DIy3FImhCJNJor2sdJ9VvIUjJ94CKg2PinxsdeWIAxcoGYJRgXAJHnRWMDGQ1PuWftBYKYF0w4jt47WiUrsmdUj0JgkpFC0lvSdqNLcwns2RNlDeGQuuGNd4DzD1BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748460221; c=relaxed/simple;
	bh=YtbJtZ9j42kmjKldmJQf5mvGbou/uTiDwtCn4zRVBzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SIe9WYNZVns7ORxcFH9e9R+hB+auWSSdN9cPvla/KYdQu5O+UReW3v7oWdafW0vMzzDdHB1YCxBTP7wxGYf5AErq6/X3xEC0g2QoZmd51SbpoldLdtC9ZT2BioWQu2BAUKuADIYZXjNJHNqnirA13mfOx40v7XTmAxFczfjHoN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lhTYe1pv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lhTYe1pv"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S9Z1cV012389
	for <imx@lists.linux.dev>; Wed, 28 May 2025 19:23:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tGIelMzb7anlOtz8UeqEqZt+
	4i8vYbVYnWcSqbgsCCE=; b=lhTYe1pvmICNCmLlgitNFi8n7jkEBn42BKSOuozy
	gH5q8YtAam5lLMoB0oEU/11m93Iptsqgb59u7tPaTCkLI7YllyONTGKVsOkzZhkQ
	dM6Ort9SaBW6z6lxQFCTxpFlKOsRe+swVpMccrmKVQN/YGJuZF0Yi5YLFbmPVud8
	/MEJ4S+ATaR8SZb11UXlyAfHGjjO5gX6ym06MU2YCs8j3DSXVVkgwFMGhsLpZCvc
	pWEHhYU691ynpJkDlOwmP9lF4XrDDwvMQwLVk8cj07ycyp/CRvsjzQpZ9XqumCL9
	TrhK3XMbNaJzzXu8jw1ljUbSNO73KRJdwCUEesepO1jnww==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u549k9h5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 28 May 2025 19:23:38 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6eeb5e86c5fso2762896d6.1
        for <imx@lists.linux.dev>; Wed, 28 May 2025 12:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748460217; x=1749065017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tGIelMzb7anlOtz8UeqEqZt+4i8vYbVYnWcSqbgsCCE=;
        b=kXGVio51Js0NiKO8OUsoQN+unciFQbsG1Zac/uf2gvjLxCZsrsJzqIkDE6XONSli2F
         /Uuttm5eSD6reD7TRspKQqkqGZuimmqpn5WcU1D+ixWYMFXEI3n3d+sVHIoIds+XZlKx
         YFjFJr+7NpAEsvvkWlsTvFZv9XSv20ymDhoCqhrPY+V9U7E8PuZ4ycsq0s+cW8DsG27+
         xpo7707ydcSja8dX/sOeKp1yRR/LGBig/eUk9Q9ZagZ+WZOBz7GlBkzW3ADaLxkUTwkd
         weaHb3IXCi/1YhjLJl1/pVA3xtwKLYqcMUNWTpGgwZUC9Bz8M6UbWU9IHUXzUg5SfcMt
         NSFA==
X-Forwarded-Encrypted: i=1; AJvYcCUJZaAtHEVZvC4QlBy8eTyfK+brVYlRtw0xl/qmeBAvPr3tRxlX1fMaqxjOC17rlsnAeKc=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywk6JxveE1/d4FHG/7OfuQE/PXphWVuEnB0ghjesUACrmWSire/
	bEmm+z9xAgsE3Ipmb8NPB2AOhbG1bGq2ofPpykKgjC4mudjQxrMWkMeuBdYv5rYJnW/caRC9Lrf
	n4GstmqFk21bSxrZUqrrFD0tQ1/SRzxhhxdLQoZDoBzpbOSQFm43p290=
X-Gm-Gg: ASbGncth3C2Z1mARSSFQ6ykL6cxu3JV+hrpQJC+AOkA1VMWV1CIZ1555oIjoCMtDv1N
	ftxuZP/68UfZy9IFm9fkQbToQDmbA1B0EDYActVNOn62ssl1nF8TtuTiPdEgknT6+mYjuq518ju
	LAnIchLsqKlgeUBMz+rhtxCafL4SEMCmMQHJZCioHgZ8of+0+lTIgO05fYCn8KUASo4T3NIKMQp
	KgDci75ZpGIhTMPt/H5PBLjbbEBEHnx1TfefE3y/zsq4xNA27hBd1aOR4yCZbhTjaFIxCQDP9P4
	uh/tJVrhc9s49ebk5CEJs5XKnuwwd+wHz99wFlBhTdGPrXNTBhZ6MzIb+r7PqWugJswQVtQjGKA
	=
X-Received: by 2002:a05:6214:234e:b0:6f8:b4aa:2a4f with SMTP id 6a1803df08f44-6fa9d00777amr236028236d6.11.1748460217334;
        Wed, 28 May 2025 12:23:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMPfAIcdcaS91SNuuMoIA5lDePhcYw7vO3zvie75YA1Cd8oqTW+ZaMVMUi8YvVPpHABq/2ng==
X-Received: by 2002:a05:6214:234e:b0:6f8:b4aa:2a4f with SMTP id 6a1803df08f44-6fa9d00777amr236027826d6.11.1748460216971;
        Wed, 28 May 2025 12:23:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a79eb95e5sm3635891fa.30.2025.05.28.12.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:23:35 -0700 (PDT)
Date: Wed, 28 May 2025 22:23:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ai Chao <aichao@kylinos.cn>
Cc: Johannes Berg <johannes@sipsolutions.net>, perex <perex@perex.cz>,
        tiwai <tiwai@suse.com>,
        "kuninori.morimoto.gx" <kuninori.morimoto.gx@renesas.com>,
        lgirdwood <lgirdwood@gmail.com>, broonie <broonie@kernel.org>,
        jbrunet <jbrunet@baylibre.com>,
        "neil.armstrong" <neil.armstrong@linaro.org>,
        khilman <khilman@baylibre.com>,
        "martin.blumenstingl" <martin.blumenstingl@googlemail.com>,
        "shengjiu.wang" <shengjiu.wang@gmail.com>,
        "Xiubo.Lee" <Xiubo.Lee@gmail.com>, festevam <festevam@gmail.com>,
        nicoleotsuka <nicoleotsuka@gmail.com>, shawnguo <shawnguo@kernel.org>,
        "s.hauer" <s.hauer@pengutronix.de>,
        "srinivas.kandagatla" <srinivas.kandagatla@linaro.org>,
        linux-sound <linux-sound@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-renesas-soc <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-amlogic <linux-amlogic@lists.infradead.org>,
        imx <imx@lists.linux.dev>, kernel <kernel@pengutronix.de>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2 2/6] ASoC: aoa: Use helper function
 for_each_child_of_node_scoped()
Message-ID: <mpj5pvugs6gz3rhjtntshvbwbtmi463zg6jc4tatmvh5uuljhe@44kbv4di2b3s>
References: <2aq0nyvyf7t-2aq4hsc7kp6@nsmail7.0.0--kylin--1>
 <7e708dcc98c6f0f615b1b87d190464cfe78be668.camel@sipsolutions.net>
 <eb1ddeb3-06b6-4ac5-b20a-06b92c7f1363@kylinos.cn>
 <23aadbd78d3585c900c579c26f360011cf1ca830.camel@sipsolutions.net>
 <9ec008a8-b569-4ad1-9206-fe241fb1712d@kylinos.cn>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ec008a8-b569-4ad1-9206-fe241fb1712d@kylinos.cn>
X-Proofpoint-GUID: MoY2atWOmq_WmVoYM0_oPLFKt3OHszLK
X-Authority-Analysis: v=2.4 cv=E9nNpbdl c=1 sm=1 tr=0 ts=683762ba cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=3idkMoHJoOCuPmDIWoEA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE2OSBTYWx0ZWRfXxs/4nbATb+Dw
 +79iLbMR0KUlh8q2a4KpIdPyAJ4WTYsg/MlRbxmOfbwF5a3K/3aDsA3ORxtXSSN0vnlqv4/O+0O
 AKBR57Rkfhul9JJih4KSpRlTiuXMhIBV1kuAcCnjJo5pP3jHfBQGyNgjCHJ6HpB7SmNxcAgS72y
 LS2hkZgqHZhPOeECWZiBmO3xdXlKNOvxzDlzr15jHe0uzlztotpKGedsxgKi0xqVQWxj58Gmhln
 TsJQvtrm7xIzVUGWK5ZaGJspYDfVkFOnvBC/lY5kvuYh7M+WzSevexulu94BOU2KUonFPjfCrZo
 EWYz0pibQZPziF/lSap2Uxbp2dupX8h6nF4vvEJr4Gbn+JOttRJUme1ucs2C141LYbRmpyPeGmP
 FHjxDC+vUgzHa6g4f+w88YXjZi2cgDxk5LuxoxCdhg6U8jaLFS8OMTIc5dCvo5bOYfvo09Sy
X-Proofpoint-ORIG-GUID: MoY2atWOmq_WmVoYM0_oPLFKt3OHszLK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=479 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280169

On Mon, May 26, 2025 at 04:20:37PM +0800, Ai Chao wrote:
> 
> Hi Johannes:
> > > Hi Johannes:
> > > 
> > > > > "simplifies the code" is no need to callof_node_put() .
> > > > Fair. Except that's not what you _actually_ changed here. Like I said,
> > > > either it's buggy before or after.
> > > > 
> > > In the function i2sbus_probe, it not return a struct device_node, so , I
> > > think function for_each_child_of_node_scoped is better than
> > > for_each_child_of_node.
> > You still haven't explained why it's even correct.
> > 
> > johannes
> 
> The for_each_child_of_node() function is used to iterate over all child
> nodes of a device tree node.
> During each iteration, it retrieves a pointer to the child node via
> of_get_next_child() and automatically increments the node's reference count
> (of_node_get()).

This is not complete story, you missed the second part of it.

> Each call to of_get_next_child() increases the reference count (refcount) of
> the returned child node, ensuring that the node is not freed while in use.
> for_each_child_of_node() increments the child node's reference count in each
> iteration but does not decrement it automatically.
> If of_node_put() is not called manually, the reference count will never
> reach zero, resulting in a memory leak of the node.
> 
> Best regards,
> Ai Chao

-- 
With best wishes
Dmitry
