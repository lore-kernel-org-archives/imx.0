Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA81734EF15
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 09:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837588; cv=none; b=qtyZl/KfnZ+8w9qn/K1q2bKQdoV8TRXi0o421ZW/NvVPo/7TPNyGUU9vgYv80qY+YwEqh3ExQVxr17o4/f1yQWS6TaXw8fyFgx3n+fY4BrLEeKN8mLVNMuZLYnWGzHZIwooCXeEyOFvkFkG/JTEILHz3MXXvvu7wuvO1frPbqdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837588; c=relaxed/simple;
	bh=deCpsbgsyzGz52UYVrUFu+GK4rDUeaxHx5qfsuJiwbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d1S+S4p3M5yBcrASWQDu9ha+OdMrRgusWm3FlzacsMhqZHd5vCpoUTJ0elnluUwLO/X5Ab/375pKlnTkLkfoO6o5f7TOVJBhaoaNUgNWTWQLRLoZmIOHZU4747s7LgaK5JNxnhuNOgwG1g3Ct7G7D89CZEcTM+xLhN080P4b+Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lCyqVScc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jTFLaOeh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lCyqVScc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jTFLaOeh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMneNv2783699
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 09:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4IEVe23JvosF/ljVHhtNPHgumeDGeBSyPmBAPyvh5HY=; b=lCyqVSccFm2MNmzq
	d/VWC0//Ou8hzdNf1sUs01NwCFgGtI6gp+comyP9bcJ9wz6wYtMv5SRADSyOfPbu
	cLPxr969xyh0DoSsTvzjlM3bEa0UhRAkhzvogOqv36RscKZxZ/8i+qLP2OioAIlf
	9oK5GMyIKP9vbCVc3H7Jttk/nm9/yn4S+uZ5pVDmSgDrzjOrPNYulSAC1RYUf2D+
	ga8pXgO3vsN2sNLe/0Ec1jRr95T2Hg/59NsYfamSMPQcqYe9X2uOMFmykvZ9NXbG
	vTgNjDnB1ZLS8Y5T/zI0+EFroavgpPfxpJlzPwJdJumiaTnCdGTyI0HqILFH6FGN
	1pAGSQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vgv3ge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 09:06:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4e37a796so3431640285a.2
        for <imx@lists.linux.dev>; Mon, 23 Feb 2026 01:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837584; x=1772442384; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4IEVe23JvosF/ljVHhtNPHgumeDGeBSyPmBAPyvh5HY=;
        b=jTFLaOehcK/+sPBIqCBPFnuZS1liOQXCRYVvoVrPKSPRIOnyoGRB/+nM7RJkHxDkKm
         exOiEgCMQkfb1fpHAua/AzjTIYACiinIH+Wdv+td5m9n/v0P6XXtLNHpjy7E9rMHXnPj
         DEm1jVyY86pavwGiiRzzqUiyyn+aJH5rNVhj8jYYsn7EE580lhuIANK9AOb8tI+Z9JoM
         l35q13XX0tvOdaJAsEWC1KopddqeFVRzYCE5x4SGH8ilJ/88kBegRZQRq5/OzxkVumRl
         2HNZrTybSUdWaO49RHr82j0Na2kdk412HHx5Jp2vKLH3G1mxMCQkBOqOK3bCU9RVhc5N
         Ma+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837584; x=1772442384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4IEVe23JvosF/ljVHhtNPHgumeDGeBSyPmBAPyvh5HY=;
        b=FsYa3ZG+3IcgR5niKlwPUwpG4kaHx2Tv79WMk800sl9ZtuwFfmNn+FCaA+sLhFqPQ6
         8CHmm+KXjWBp+ObPPHq5UZ2/X0BzeFD4fRaP7E5601U148mtCDQNu7uSbyB8A4/O/Ssh
         h4nDxgA7JPTre7KVo6bCnXRgPPouCkSuWgHKs+O0O1qVpl1i8GBbVut6VHyQnEd7KikL
         lNawcQ/Df8H7nlCfPpxWCRX3MjW3YMukKLQOkVYXWkfsYLpZzmezWy1AVM2PLNWh7UE8
         0MxmWCjfPP6usFGXVpaTwnpDkIFlmhmhmGlylmYNr3jASsX0+0gewoE5wIb5brtCUdyU
         97lQ==
X-Forwarded-Encrypted: i=1; AJvYcCWL6c39izSvcxT7tVbQKr0Qw0szWXMcO74A2pI27AO7Cmdhxag205zCHarV+sCA1KLpP+M=@lists.linux.dev
X-Gm-Message-State: AOJu0YwRlRnKHeH3X7wrm71nr3CFTcjrpZ4a2vCcHMw9wNw6SW9vz6ld
	ZYhmYagYG9UDB7VPg7cJ2DEp4/LAbpsTJ05o1gjL+kr2Zue2IMzqnYAVh1XUB0fBYEcydw0KTwj
	3vPSXSFoqSMvX80/J5mKTDNmyAiUjMYnAx3gqBYyQd9zBIyBWo1Mgvhw=
X-Gm-Gg: AZuq6aLldLVaHworGHHVFCdy5RRLUwtP7VYf3doKUCdR170O/luxKd+l6XLwgphcuky
	vjkw16X0Le9+SviX+wQwspet/VO693OP5Jy31Q7lflsfqNwCpp/n1celtNR322s/P0y2LHeJ5FO
	U2K7EmKlXjRMw0Diol3I891FpKJFcUCKq7X86uYMFSLZIjjxBtOu9JTSwzEEaucuzykorSipx2U
	FvZP9aQN8K84AD/HmwiVJYAWY2viLa1jnUl+64oqpmCGOZNYTHHw2S8u4BaUGAHA48hAvLEADwO
	ld8LqNQEV0RhHm2Mz2UF91o7G4g4dam3Zcdqjdk9DpQUaSmIU98X241zBek4ATVcjK+W+kt4D6h
	51xLAj3xKtnyQdrh9qpZ66K2CaNQdcN/eKVm/hIr/Yvg+u04yZ/Bm
X-Received: by 2002:a05:620a:1904:b0:8c7:10dc:9055 with SMTP id af79cd13be357-8cb8ca0b5e4mr941451585a.23.1771837583983;
        Mon, 23 Feb 2026 01:06:23 -0800 (PST)
X-Received: by 2002:a05:620a:1904:b0:8c7:10dc:9055 with SMTP id af79cd13be357-8cb8ca0b5e4mr941446385a.23.1771837583455;
        Mon, 23 Feb 2026 01:06:23 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9feasm17791593f8f.6.2026.02.23.01.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:06:22 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:05:52 +0100
Subject: [PATCH v2 06/12] i2c: rcar: set device parent and of_node through
 the adapter struct
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-adap-dev-config-v2-6-d78db0a6fcf7@oss.qualcomm.com>
References: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
In-Reply-To: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
        Frank Li <Frank.Li@nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1308;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=deCpsbgsyzGz52UYVrUFu+GK4rDUeaxHx5qfsuJiwbw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBh2nfK3wWYF2E/xl2FdbyYiySDaGr7DmWU7Y
 gVOwe1z2tCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwYdgAKCRAFnS7L/zaE
 wx/KEACU1EBIcNW47+QMfddH+tXvVKOd2tvwk6pL6qS63YjG7EoaUpXM31XW4EJi7MqCRLRCDlg
 gC81tNRb+Zid1pqEiPYtS/Kqvfp1ycij7mS5/LnnC17ugukqtbneKVtXQRVg9nny9MfzCxP5UUl
 xgHzIFWCwq98ELAqzaSg4rrdG8ofefA0PJEcuq5f2fPmsQyAHcF62k6bfZWOV1+vcJkgyU9GZxR
 NOjBebuqmXgJP5NisCzQ6Nu80KBwZT53MEQ0heWoc/EiSuxxgogMYrBCBsL/WFj49zhR4+4/EJV
 adnwNMA9579jlTWF3Szxb+vG5W/MKZTyeqxSA9BZ2NhPsBlNReYLHjJ429tUvSg2rnt6q+qFftT
 Xlmh42TrNDLpPpdXFvJ9KRX0enYLbt9JXs9AkIGQKiLYrAAwZrwodaptbHtC+XYX4uPiKwbKd+0
 2bIJgfeim7TcZL+Ruh1mfmXHgPwUG3AWFArAHg1sBe047KuWqd6PbBFFkQlH+K56BRq0lU8Ch2y
 7sJawmyu6+SbRyP8DE7EpDWu5EYph29HOzk9f/NoQSC3ARHNUayWALyELpMufM2EORXiNq5M3YL
 S6yzQDKetgiK3wkpUAxzJKwZBzmE7clZ7sXnbfXLcJXmNjOQlikQbZ0dWNcmnuq9OvqeVNqfqPQ
 boJzOV2Zd4srHmA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX1y1pLMTjJuSa
 7HxCsqZ1JjvjCv/ojnY3yzF5QoeB8+r2S8yvJAmsqkYwB91I5V2QjAQCadyUZ155lYefl7Op89w
 EZ8YjuX3Tc4T9+Jo/txeJtbhVGbAvHYbq+vwQZJFdd2IMK9uNZio7PkOCWz66UwhNVLikvdBZGm
 ju9a78GrbrpbkVL0q2Q1PAIV1fC9lAnapHSw/Fs7o9hFY1azEOfjjlz/Q1xhcyNPoPdwyYabkOC
 igjtmVUbRj3QvK5xkqahPh0CLdecGgDuP/jQHGuzbxebF7V0U5F9oNu/RUrSjkK2fJqsgZ4Khx/
 qdNa0dmoreOfrDLvYPEAGxWHiVf6YrAqVjefFBX56JOSA8KQgpz+DiwipaCRUwW+35oJhCXfNOH
 3JkqT0cYsjW/lUcZIO1grzkHIpOPw/ck9K4OftxhTUvM26L9vAJAce/Nm3OSHpbseVOQ9QLR1J2
 TFhGmOv53upjcWGwzAw==
X-Authority-Analysis: v=2.4 cv=W+A1lBWk c=1 sm=1 tr=0 ts=699c1890 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Cv5rWQh4W07jABGdPz4A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: ltL0sCIQJWSVtLHqzEaEqQe3y8FVXTWg
X-Proofpoint-ORIG-GUID: ltL0sCIQJWSVtLHqzEaEqQe3y8FVXTWg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230081

Configure the parent device and the OF-node using dedicated fields in
struct i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-rcar.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 5ce8f8e4856fb2bb21c9cd731ddbbd8f3622ca26..af96892718fe04c5c428c82d3a47ad23aa08ee9c 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -171,7 +171,7 @@ struct rcar_i2c_priv {
 	u8 slave_flags;
 };
 
-#define rcar_i2c_priv_to_dev(p)		((p)->adap.dev.parent)
+#define rcar_i2c_priv_to_dev(p)		((p)->adap.parent)
 #define rcar_i2c_is_recv(p)		((p)->msg->flags & I2C_M_RD)
 
 static void rcar_i2c_write(struct rcar_i2c_priv *priv, int reg, u32 val)
@@ -1149,8 +1149,8 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	adap->algo = &rcar_i2c_algo;
 	adap->class = I2C_CLASS_DEPRECATED;
 	adap->retries = 3;
-	adap->dev.parent = dev;
-	adap->dev.of_node = dev->of_node;
+	adap->parent = dev;
+	adap->of_node = dev->of_node;
 	adap->bus_recovery_info = &rcar_i2c_bri;
 	adap->quirks = &rcar_i2c_quirks;
 	i2c_set_adapdata(adap, priv);

-- 
2.47.3

