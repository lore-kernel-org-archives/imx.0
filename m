Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799972673A5
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 18:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771353277; cv=none; b=F5UjT9ByNTIfd04CvrsB/TD+j5ASQJTnDkX3iqlRL60OyH1ThCA1fZmEFDjGIuSU3cFc5LBXQoGJFUT4+RjHScp9v+CbTc8jpjrRH2LhNOH8Hisidm7QY5A+1ZKxahpqzbhXkBSFD21DEqoPEkiuKsRUkfa0fQ1/OmgrCv9o9MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771353277; c=relaxed/simple;
	bh=9D8P1j5eIMJ5b8STGnBJ7d6OsDNVGkrvoRzQ4uX0QdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S8TC3WWuTGtAf6kAfSWkhXjhjNeIwc9nzQvRKJhDl0Gz7O321hQ4jndPZBogyG0A52I5afDc8D5VoAkYwhU1W1DKhqT+u7NLef/kZvK35V6998yx2wCRRBMGsYvy7iRYkhNWb5FRT+Z2nHO4nIu7G47jqA2PFSP2mXEvQGtH4cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LHxKULUR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eAYzjCxB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LHxKULUR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eAYzjCxB"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HFwwo11601139
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 18:34:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HZElJviG4NF1mW6UtvdcdLWT
	vHSgF6zYjPqp+73i8VE=; b=LHxKULUR8AdJLUA+Vd99o1XvUr9hZBufaxlm8UJC
	zwiHJ26uBNAatSzFqPVa68DvlOHxOMy7OGM6H3Gg1z+NHxOLoMqS+ojcaEKd04AY
	xU+US4BBAKk6ZlehHl/K5KjN+7mZ8Z7j5DuXlzvhn3R6ewBFuJHpLGc1NNkM3KIg
	SR4ei5eYh+RERmNU9lawcDgWB/r5sl0OnOGZ70+RnB2baaY27+txWqjrp22gIkzZ
	e9t/Jzjo+PQ7L4v9SL9BWjJt0xJSaTMlq9pOZtJmhw3ptQPoS4mGW0TwR0nkfrVK
	yDDS5+SIa+0zUht+7RmLCxLpOGhRk9N9APyuiNYz7nRWag==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6tmbdg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 18:34:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-356236ae3c1so90237a91.1
        for <imx@lists.linux.dev>; Tue, 17 Feb 2026 10:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771353274; x=1771958074; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HZElJviG4NF1mW6UtvdcdLWTvHSgF6zYjPqp+73i8VE=;
        b=eAYzjCxBS1hkuwO25LqRl+K6iv1jKVxUykoqqlQl4ER2Ez6OiaZe50bMA9bu8TlNPy
         3Ah/JlcbbSXgexbENaMw1b2fGfs9L1Et3NszZTHAs2Fu9hwhgg6n6i6eD5csixST9Uzy
         3GuVNfQxn2FAg4UfO2OurpKfxPxRGCPS4VNszueSmy1naQ1VTmAtmWAgI9EEnXYEmJE0
         VQq+PYhF28veDdstvtq8ncUOJcZI2KFlyngmrg8DFMojwnTvP7mQ82hE9vUx8S/bHaBm
         zVLvVwaaHePbxaBOcVLdJjbm2oA3j58QpvhjZMfRwA55UrTxonDqgWh1ItIkP8C1vCcy
         umzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353274; x=1771958074;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HZElJviG4NF1mW6UtvdcdLWTvHSgF6zYjPqp+73i8VE=;
        b=RyFjKWf9rwbWjag5ttjOYknuReseloKgjKk660ZnQ+mQDpMVPcKZZxWJ2PWVq9LFPU
         nb5y7RXBGV7MufKDTSpBaxZLL8Dn66sZV8eIuRCoN5pHlGXOxc1NJ4rM1qmDSlQFzeTs
         vjrCP33/NPTbzjX6h8BmGpT9WoEDWDAKw4UZ2hlxtVnbMEexyfRpZpSrzoyQWKN/J+Cb
         OL+FrL4753MIkPET3dh4PILZ3MCHMHgpIAVgeBZfmdBUQjAWY1/oNfiGY0pnqNnA/WeR
         8/qTaZ2SFBKLbwkNkgXUuy3UwgzBo6A7WewzUrxGceW+64XTObg1JxZSEv8ml0z3oyLj
         zQAg==
X-Forwarded-Encrypted: i=1; AJvYcCV9QQdqF43KQ3WlYBqLix1Y8MIeoy/b2SWRL6mQHwz0HysE/5U99E6et/xEW1v+bf3AcjE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzh5Je+0J9RePTkk+FQuuHOQEGqGMqfbsa17gSdUxugRklpBg9q
	+bY5jS6fbjkS4jIijEW5doyIYOsneL4yTPMdV3nGmbYISCADFHCpsIApbMu6dlO+oC0Q3DWG4/a
	p6Z3L0k/b0iPmYQwVLeH+9Pz844LEIex7sHYQoyugwo4CBea6mlSzhOk=
X-Gm-Gg: AZuq6aIBh3XzZV5xffvR0tbWTEx0QZ7mMWgoXvqDeaFYp7wSBpL76jKj8O61NL4iL4p
	S3LxI0OnpCz1bDpRzcUjcpiZlejogKVqkjCPKx43PAD88OiSk+Qv52yf8z99e5g2E7hzp8Lpbcm
	fP7wp/1Lv8T8dfwyGXySZ+9SawjmbzGTxN9I6sWlTezYP9rGczu8EPCQWOStDvthvxYRavs7T/S
	jqfGXsqjLxreketJgnCHBuVbv2giyCf4OGCELYCnQB5d7kY4zhsUYMU6eG8C8yqC9nNrdYO6W0c
	fDBw+qPHfQThHPFfwTQjRS/AuFn7O7yPsvztiPA7u5EAY4/vtmPLNboUtWwiwiw6avzzPdhpXFY
	xjJFCWY3TxX6GBblamiAtHN8HK8GWALMZSpU=
X-Received: by 2002:a17:90b:2b8f:b0:343:3898:e7c7 with SMTP id 98e67ed59e1d1-357b518ea91mr10071993a91.12.1771353274194;
        Tue, 17 Feb 2026 10:34:34 -0800 (PST)
X-Received: by 2002:a17:90b:2b8f:b0:343:3898:e7c7 with SMTP id 98e67ed59e1d1-357b518ea91mr10071965a91.12.1771353273637;
        Tue, 17 Feb 2026 10:34:33 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35662f8cc57sm23799159a91.13.2026.02.17.10.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:34:33 -0800 (PST)
Date: Wed, 18 Feb 2026 00:04:26 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
        imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RFC net-next 1/9] net: stmmac: qcom-ethqos: rename "por"
 memebers to "rgmii_por"
Message-ID: <aZS0skzczDS9g2Xj@oss.qualcomm.com>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
 <E1vqKOv-000000093mB-48ei@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vqKOv-000000093mB-48ei@rmk-PC.armlinux.org.uk>
X-Proofpoint-GUID: EpUGDS5l9fBSsRjd095H7-PH-3QZfCnb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1MSBTYWx0ZWRfX5GJe7266y5uT
 xMqxjePgV4exU/AWjaTOKvSemOBluGjCTFRsSJZgVLKVU1BJzctndarKHViXZ02K48S+V6WXC81
 SEUwlWXSiL0oSmutNkcZbd/Gvz3WqRDb2qVp5GwmgS+dn7GwCAdS0p/4k62iGx4oIOSCQDz99Ms
 c5gAzUw84FzS/XdN0nYSyjekcvj9Ovj1qMyR+Y09+Eg5oZvFDfpchrnz5I3jMmrl7oLA8Ome2FG
 yvVsVVuYObbaAC70N98AdbUR/LGbbY4q6lkZbEnS2aIDrpGd/5bhEZ+zjZ2MRjGoaqlfdwVWsUy
 CMmQ7JcWCMEHMm69XyG4erSMy8On4em4/46JBAJJHygBMKv5iRFqIsnQf5NzD1w9TcR84Y0pd7j
 2JTpum/dDHhnXbq5ZBJU/qhqNIfRAC/yUV/W3SK03/KO+f3hfHEHvdepQsmN1ZjADe4pbBqR73X
 7jQKQltsrdBMxRhLxVg==
X-Proofpoint-ORIG-GUID: EpUGDS5l9fBSsRjd095H7-PH-3QZfCnb
X-Authority-Analysis: v=2.4 cv=IOoPywvG c=1 sm=1 tr=0 ts=6994b4bb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=AnVTdvRHBf_CuTIAticA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170151

On Thu, Feb 12, 2026 at 12:17:45AM +0000, Russell King (Oracle) wrote:
> Rename the "por" and "num_por" members to indicate that they are for
> RGMII mode only as ethqos_configure_rgmii() is the only place that the
> values are programmed into the registers.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan
