Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD2233FE06
	for <imx@lists.linux.dev>; Tue,  3 Mar 2026 12:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772540023; cv=none; b=d9giYUo3y2XnHLdOhm/IlOVmN+tzXF1dw+SlDI9l9sEES3Oa+c9NPhSQy5Q4NOOfskhqH7syS4qCgYSd2lqwYtdrmANHscD7eOekJbCw5mudUMyNMDF4Y6awIHFV2do4EaZZB+zsymuPu4HdbEbcZcFffJA/8sD7idIn4Z7fISo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772540023; c=relaxed/simple;
	bh=n9ThQZCHpRyOYZogBfVZbhe1AsrapF6ZWMmRMx4dKmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kjqZZWlgmr8cVxsCDWqsi45rxYqwR2BSX1Hta6awPvfSPWQEjQgERh4p7lrnla65iMFG4YhSJf4WNQ7/5HWpTv0r3VBrUk6xip3fXaEzpMYBVUxmhpU11rm8B6oaZaRTiqJdHVcXfAjGb1APpdTVGE6wHLKtxZup5w705nWu+SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PJPsutLG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fyn1q3Fo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PJPsutLG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fyn1q3Fo"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239n5Br1838249
	for <imx@lists.linux.dev>; Tue, 3 Mar 2026 12:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n9ThQZCHpRyOYZogBfVZbhe1
	AsrapF6ZWMmRMx4dKmg=; b=PJPsutLGKx6Z/C+LJW1AwgvhyWXOFTNddc1IU7eE
	dMiYq+/eRmJb8RHBM2MlbKnC9hYidZuiH7jXPVu/BvaFZnWLyDMWIbQOkej71gIu
	89UlJMTJiTR93ArIEJdO4184Ovpv5f3//pi82MmE35XhXZ2e63siqB6dwl7qZ1er
	fVD+BRbdl97gflTaiV2boobS8+er7Kt6UPSCsbKpaP70t6m9MhbjaNy/limKoaHJ
	u9qu2h6oGeXq8CgC5ei3yV8gyziMZmGRCWt/Ow3PeeiTtb7FiZCYprmFrNOSpH1y
	rHQZvjvVuzl6IDQ2Yn68xUJe4JKjXPALEO53BOcaI6iLgA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnngga4ff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 03 Mar 2026 12:13:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5069ba5af5bso370362041cf.2
        for <imx@lists.linux.dev>; Tue, 03 Mar 2026 04:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772540021; x=1773144821; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n9ThQZCHpRyOYZogBfVZbhe1AsrapF6ZWMmRMx4dKmg=;
        b=Fyn1q3FoCYIpbG3hflxmzeMyo0UNBeIw1JoroZmrgkvTQb+cFZVtD+SE/rmSi4NSEM
         P1V4NQCsQ6W9XJaEZVkXzU5pItucX9zHOM7S+hyrr0cVg8xPAUT49Vh3UrJ7sRLl9693
         dmxcVJzjd657Wxvxt0YJvr7/B4l3UP7CxVx8OkW6sT9YoI1pNG7yqboyxAWZq7oGy6DE
         fPYdpgLSUTRzjYOXsY/5NDhyuuZmN3dYjsTFZs7mauiFoicLSNIDGpO+C62NYruy5OfP
         tH5Fq8PvNiONRJB4ibzKBTSsGy4z94oqJVAZSA6ojgUw7Q1Slhgp0gR+rsXZQGgdxzU/
         Q8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772540021; x=1773144821;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n9ThQZCHpRyOYZogBfVZbhe1AsrapF6ZWMmRMx4dKmg=;
        b=KwyzaJJALwsvRXBx95q7Y3bnUFXA9hwWPuGtWwi4HqmKCbtMXMYMFftdU1NQxWFzLJ
         SzQTrUvWbXFms1eBE3XadgzJXUxmesKesTsNKsV+byufra6gsUnsf/8R+d+YjVDFeM6C
         mlfwlycdQ/Bp7UYVoOgGgm5mfaak+7aKWFhUfq1+2WCiuqxCPwjpAjv9VGDeKjBb4uF3
         ZPyJIqeFXCUjnqgZ8smj17i4c7OmJY/ZcgUoTGms4F8pd+m7R6XdqmpBjZH3kp1wQZ0o
         JARJHbEM2LvW6SPSBopzZ7ODQXUrxIMBiFCtB8Dj11EEmqScvc3526Se63YuykLd5be0
         mKSw==
X-Forwarded-Encrypted: i=1; AJvYcCUEkTH6pA83AN+NYPUm6sWvsEWX/2eqPumEN+DOEmhsDLvlNW9PZ7FTNN6Xhd02dhLP9ZM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6grSCM/b0SRudMAbBrp6+t38aBpRdyOzTHey3CT62TQE5xgxw
	UF6kXa8oShPAm7ZDdZRqPyuQfrVaxp/eT5KmPZ58W37Y/AULuEpieNXtL4igZtUfA5268oi5PJa
	N1zIp55Os6y3Yrbsk63QfOIBNbLZ6Iqh9BLfiCss0IWcZYtyPCbTVmQw=
X-Gm-Gg: ATEYQzzNqsC//haNSnU7rF6iVGcFuBAcErs74mS5EAvBvgK0r7oLL19eM3sPrIc2zLA
	GeDMO7p0kUHbDyT09Up91lqljvsM3IH515ZZnIcouf0NoIerziSYMcJtVm4R71wzTAMXEty3Wim
	aFmxEZTHgvy3KwuVy2janm6rTFPu5dfxKWEzbvLhWV0bujC3YCi6anojyLO6iI7Br2uPhxkFlGY
	XkhKWx4I+Xh1V51K3D3RmR21dCcDqIs50XcLfh52Cj/UVJT7q4y/qWhSiQ0Mgli4AKy9U030t1L
	jG2+THSlMrDLqRxgIBPhVOcn14xWjMZUMV0niyh50wOTImOQoNgJQlNroDBagzSwqt/FIlGqCSY
	KqQ8Nqz0/3g+xLDyjWRszJVYdkjRjR4XPTOqM
X-Received: by 2002:ac8:57d4:0:b0:506:a289:fd3c with SMTP id d75a77b69052e-5075273e97amr209392671cf.17.1772540020521;
        Tue, 03 Mar 2026 04:13:40 -0800 (PST)
X-Received: by 2002:ac8:57d4:0:b0:506:a289:fd3c with SMTP id d75a77b69052e-5075273e97amr209392191cf.17.1772540019993;
        Tue, 03 Mar 2026 04:13:39 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50744ad8f8bsm131749141cf.27.2026.03.03.04.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 04:13:38 -0800 (PST)
Date: Tue, 3 Mar 2026 14:13:34 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Felix Gu <ustc.gu@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
        Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Akshay Bhat <akshay.bhat@timesys.com>,
        Ranjani Vaidyanathan <Ranjani.Vaidyanathan@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] clk: imx: imx6q: Fix device node reference leak
 in of_assigned_ldb_sels()
Message-ID: <nfrgeg6uzbkzri5cedihxfw65dnsglytkhbajutuutddvyabuh@mtnjxxde3gzm>
References: <20260203-clk-imx6q-v3-0-6cd2696bb371@gmail.com>
 <20260203-clk-imx6q-v3-2-6cd2696bb371@gmail.com>
 <aYIxjWYq3OwwmrTO@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYIxjWYq3OwwmrTO@lizhi-Precision-Tower-5810>
X-Authority-Analysis: v=2.4 cv=P7E3RyAu c=1 sm=1 tr=0 ts=69a6d075 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=8AirrxEcAAAA:8 a=Vg6-HkV-eu1WfDdlyz8A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: dvDaXJPvSbTudWab18006t7H1oJZtoQW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA5NSBTYWx0ZWRfX7NqIVVPttteV
 +PAIrpXW6WTp2A/6MRbgz7jGzEVWcpBo/tqBRadn8RictnU0Qbi22U8SZSwF5YDlrO3xRCaxnqz
 TWdaGchvdjussYJDIWpuZKAbc13iAQq7nMoF8wodKSViGuVcn7DpvPfZO0VU+nn57b7HVOuIJuj
 tx7zRihjopqXC+tsCWwBIVG7A5ooKA6vxa53iTT4jog/sfEBaeAt7aAQmOAbuos3TbHJ2Xr6fpg
 u8LpKp8bX7LQYKJPP8UK/P+V5bsZSDUx1lpP93F7JZCyN4rWtmWV7fV3Ka23oi90rHkeO9Jj7OA
 CimxjnP8DNi1bNYoRZ0UyLCBpVcRGuzVPXaytkvEGaPNFXkFXvI+x7fAXtYR0/2DMDQGf25yVVp
 Y8JikDm+cMerXGOwmwNvIsaJxSxucQGO9NH3uMuH7cvD+gx72jklQV7jEvQlstsOKkdOQJuxB2z
 NvD0ICnl6DaQUaEs6RA==
X-Proofpoint-ORIG-GUID: dvDaXJPvSbTudWab18006t7H1oJZtoQW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030095

On 26-02-03 12:34:05, Frank Li wrote:
> On Tue, Feb 03, 2026 at 10:07:58PM +0800, Felix Gu wrote:
> > The function of_assigned_ldb_sels() calls of_parse_phandle_with_args()
> > but never calls of_node_put() to release the reference, causing a memory
> > leak.
> >
> > Fix this by adding proper cleanup calls on all exit paths.
> >
> > Fixes: 5d283b083800 ("clk: imx6: Fix procedure to switch the parent of LDB_DI_CLK")
> > Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> > ---
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Frank, please trim your replies.

Thanks.
