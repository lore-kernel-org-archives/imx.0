Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4613B8BD0
	for <imx@lists.linux.dev>; Wed, 18 Mar 2026 15:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773848403; cv=none; b=NdJfCDTq8ILbH+Mh7lAPesYWCPWDrKvMCe68r3EDxi5RvZhOu9TnmE0PV3nuheBtdKgXp96vUdhiySftY64eTa1Pqtsd/hrccYjXrOOV4d+/VPDcoyKnl7cvXljntmde4mrFC1KqEIFzajucYPG9EvRcmBpx8Tmhj4YJ2rcvFrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773848403; c=relaxed/simple;
	bh=fq8QMgxGO4I1bjwsFUxPjh0/fYBLSgr2n/oC9r9H/4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KKgzvrpLV0Q9E5rqTD+cfwRbMyEPzwpxHLuW+bm0a5jx04W8wPMQ4KQx29jiz/Rejaei58Y7pa8V1eio8IWFLWoIh3tTIKfqrdFWqNC9RxXv8uf7j42Nt2VAfA6ReJb8Y1eajitoy9nsMcsI6+PN4xt/Yku8ECrhVCXwSEK/L84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g7Qc9Gzq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ao5fUbr8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g7Qc9Gzq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ao5fUbr8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IFX7vS4088320
	for <imx@lists.linux.dev>; Wed, 18 Mar 2026 15:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e7PSEs4PQLk/CUQtS2pu7HepYiSKsXDEHL/qILTq9dE=; b=g7Qc9Gzqv7FTuSVV
	sx5RAE1TLnpBzhaV8WNbGJTH+G426L1AjdZhaiBTjFyHjYTVj3iof5a8Rbn+UsPr
	1cLq69tAJB8S5os7xGHoAR26JGe6g7Fzg3fcoW2cF/ACthdf7BGy6O7QIoNp9dOh
	rwuzw58pQX2PI4Fs0j2za/no/mXbJPf04h9BPRgpIf560jhzeV8ontGzssoqEKP6
	ou6PRFqyJaqmyqNXVMP85bOrSxEvABpgSGlEBOstj4elQBd5yE3GO+M0aU4Em0df
	aOZUwoxIIs/bYcz4PvxyOxI5EzhhzsVBh8NnD5rRAcmslFWWcxpDoZ2eOhVO1Wdn
	wQ8vAw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cypwr25gs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 18 Mar 2026 15:39:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5092135f2e9so392969901cf.2
        for <imx@lists.linux.dev>; Wed, 18 Mar 2026 08:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773848397; x=1774453197; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7PSEs4PQLk/CUQtS2pu7HepYiSKsXDEHL/qILTq9dE=;
        b=ao5fUbr814l7w7zDg89TQ2+yhUX+OVjH+6mWbDmSMbxzNAahOIAug+V2w3BAvPjfvy
         ub439zjl8DmUabLqPj9ff1HwrbV7WXZSIoP7kcCGZlfiOKe5kJYnZzG7qxujVLSJxHQ4
         8rC0jKTV6WGYUmAStEUSHFybJo0e5Hlk+6wmp8bph06CZsbadkqU0rjnq81ZhpwXlp4P
         79kr2yHqYJAFeUBNaLs4GtRNBa27nbB5LfwUp9wEp43w8UGUzveerynhbrYkPXMp52Gq
         +wVoSchaOaLEHkaP5kbEWITeZAYicsfwgR791ZZnvOHD0sSlTVCXj/W6/VPZpEWj2KM3
         A/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773848397; x=1774453197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e7PSEs4PQLk/CUQtS2pu7HepYiSKsXDEHL/qILTq9dE=;
        b=qcuzTU5dieCBB84+WyB5r9OtREAsK5QQlCPGmBF6xXGiXlhr/CUgV0vOs+pkkOGNtG
         uEApL7KFZjJT1PZ5zVTZRkCbKTMeROVSdCkqjnM7W3OTrx2D+HM4sVfp1WwtJV19kWJU
         k74JRPQcOl5kkinZ1inw7buzqMcd4jcb07tITxgrTm9Mv02vYR33OC+ab7ZRgK0IIuzM
         QD7BZ0z3szJllahAiPoFZbLbdYz99N37TeF1AJy8naRBQXjpaBdWA4igleklnOZQbatE
         i/lbNM1CRosxqRIaRVipOmVf3MrtlIcUpGYH3tJoNYlpwh+5nX0XssGtyXGTZ3OgDuL0
         rHTw==
X-Forwarded-Encrypted: i=1; AJvYcCVGsN8y9MFvpZBYvgTj8SPfeqMe7qEVInrXD/w6chEdIx484uooCQHWlPxRn6N9qJ4A9t4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yypfv1QDsxaEvrw3N+HUmYo/SaM+rMRU2bnfr8Zij+K18R+mHH8
	Vb7rhn+K+zax/nKPCOfRMsYhLT5CJd0Q0JuAsPsAIOEF8ZxYl8cbB/Xn46Mnh4EmPH/y0uz/3Pi
	eOfhf9fHvULNS7b8dck4BXb++Gwcvnpq4yFYat85hZ/8gAL8BsKJM5kY=
X-Gm-Gg: ATEYQzx3uM9QfAZ/wte6gShYFAXg/tb7DeQITR1gwnaIdjbkrr9faPT6gSe/boJjwDL
	Gy8coZxWorzuD6b1ZaTK6rzqsOmduurWVrLtuRKF1tQFzUHW++pwHp7wtEdUnd28pyVn/c/BQWV
	h/u9SVDUzgqFJWv3LYwhBlsApz9SqbW6WrEXzYupm0K459gKmQz/pIa80d5/yyC9YLIZjdDWtBL
	tkmCtjIvMfV/99YNhIp4ajGGisUVepYn2+yiBQb5dQGIMcZgxCNp7liwmH3tswV+3H/eLffT0pa
	1sBXVFFLHroaKgK2tO1pxSlv638Wf7kTxdRrowVP66OpWuYX7+PHOu6YzR302XPEWwQZpOHKpAX
	FmDs4RpQj1FTf0WZBi4hbWBimVsI=
X-Received: by 2002:ac8:7dc2:0:b0:509:473e:2a12 with SMTP id d75a77b69052e-50b148a2691mr46167451cf.48.1773848396943;
        Wed, 18 Mar 2026 08:39:56 -0700 (PDT)
X-Received: by 2002:ac8:7dc2:0:b0:509:473e:2a12 with SMTP id d75a77b69052e-50b148a2691mr46167001cf.48.1773848396367;
        Wed, 18 Mar 2026 08:39:56 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892161sm9227560f8f.21.2026.03.18.08.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:39:55 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: abelvesa@kernel.org, peng.fan@nxp.com, daniel.baluta@oss.nxp.com,
        mturquette@baylibre.com, sboyd@kernel.org, Frank.Li@nxp.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        gregkh@linuxfoundation.org, rafael@kernel.org, hanguidong02@gmail.com,
        Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v2] clk: scu/imx8qxp: do not register driver in probe()
Date: Wed, 18 Mar 2026 17:39:32 +0200
Message-ID: <177384710701.3709943.608237959975537642.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260212235842.85934-1-dakr@kernel.org>
References: <20260212235842.85934-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bIcb4f+Z c=1 sm=1 tr=0 ts=69bac74e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=bTwR5g6i7njH7xachKcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: WCUp1dtUdv53LeBw_9GsL0_vxApb9n7D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEzMiBTYWx0ZWRfX5Usn4+I1O7TA
 rnZLcJo+5+GmDR13hUj0JWYbDFGWj6WzCOcJanAe22/OwSQxFZJJM7nTxFUXziuZMESD5MRhtJT
 F5UgTq+WIUdAyp0l+rmrNd2Ba9FBr1ypsTlYI/75OaaidnGN3/diQYQS1L14pmHJHDNwq2A0gz+
 muq/kccxjll04QazauE8ur/AVutEkAe0E6ogRMf/vDOiFb1sUIyrGfTxRvHkdpyLAZIejk9Noxr
 78tIAvZRz/7pYnz+4tJ2bBH7Dp50qoswNW8suRZtYHBnPNz5uUoHTN4qcJjNiAIjN3KyZ0X2sL3
 vIBCEoL5WzVKsq54l8He8isUPrtXMQs1QDlYXiHulWa8XozpOJMmkUOuBtMgaDF+x9wnb51yRCi
 7rSE76PnOrs+7KVQU52oLBPzCiB4svRHlxCZ+Ly3YDbqHFt/HjF3cACwmsh8pCxYxtPdCTj0ksP
 yKftRjs1ycwNCO91y0w==
X-Proofpoint-GUID: WCUp1dtUdv53LeBw_9GsL0_vxApb9n7D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180132


On Fri, 13 Feb 2026 00:58:11 +0100, Danilo Krummrich wrote:
> imx_clk_scu_init() registers the imx_clk_scu_driver while commonly being
> called from IMX driver's probe() callbacks.
> 
> However, it neither makes sense to register drivers from probe()
> callbacks of other drivers, nor does the driver core allow registering
> drivers with a device lock already being held.
> 
> [...]

Applied, thanks!

[1/1] clk: scu/imx8qxp: do not register driver in probe()
      commit: 93a6d39e78bfa78b2160621aafbb490e063f12d9

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
