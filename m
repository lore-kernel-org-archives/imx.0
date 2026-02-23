Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BCB2264AA
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 13:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771853871; cv=none; b=f4R1IMUfUoFHzJAJl4qlBjjAHj6XaxRRji6qgObeiN1nzxOKEuSKiXrYPqTD+fgi8+c5bbt915f2kx7CJ8dzue9Tu2D2f0vhAwY9eh2may5SIpE/YgxJd6EmTZ5zcAp2j7QchqZ9Zug54+tGQ6RZQYjqm1rpt4ov0Yq+Iz5DcO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771853871; c=relaxed/simple;
	bh=/FJTjprAWyIQ0p28j68CoxC5wxhBmOvR55ovCeBCxn0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=msJbBpkjzR6UJKd2AXVe86Fq9YlSGe+4y/I4+nbQypGb7Mbvh0VzhacAJFYRIj0R1CjZp64y5CHWq5NCrhtyoP3UiOwgg5X3YoGfKSte6NZJU+9PBb7m33ZmvfxNgxkokxjHtkis7lclK4++DZPMGRNj+RsRelBJomhjhQT1Lc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gc1bpG03; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BAAQphW1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gc1bpG03";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BAAQphW1"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAX3pF3698602
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 13:37:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wvQJhmU1k8bUYS3FWgrNuYxQktXn2plA05N0IuUgwa4=; b=Gc1bpG03f022UNad
	fUDzodaBYofNggGgA5AoUsJO8Cae+F2eoClsfjq8mxraTNEdYl46C2C6dPC6b3oc
	IzwMC1C/OASIq180M2ajZXcnIp4sTKme4BS+j46IJ08VbJse3a12CtSUcWOw3xWm
	IMALeVJl0dsGdUKPb9T5wdbgPl4ypkerwEVfgE7Gr5Aq4oS/Ws2gXQrb1ipfaPwk
	659QB1Sbq5CYS+qe6ZvsFhsoixSsy5+yMNbsWQg89wpUSgTI9fgOpFd0TPe/Cyew
	oYwByt+dZsthF1xqJsVtY4bAXA1gsXI7ionPuAHjcZJZxSjqyMWzYaao6/nX17je
	WouRQw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn818fgx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 13:37:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c71500f274so487983385a.1
        for <imx@lists.linux.dev>; Mon, 23 Feb 2026 05:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771853867; x=1772458667; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wvQJhmU1k8bUYS3FWgrNuYxQktXn2plA05N0IuUgwa4=;
        b=BAAQphW1GyK/+iGZoJYtzpmA3ZWkUYN8Q6ny0t+Lgz3Lpzox9Aks+2qkCNcg2IIVzs
         /fr1s/IglDBeT2DCFyJz3YZhcYJVpSItThRPyrNGk/z8B9e8nvCEVmXtKh6pWmfbfpMu
         y4L/i/Ytsua3yo5N6q8+O88Zy7e+YqeBgWGeQoFHukts3JSci2uITELTJcWl2M+T28cb
         3TlXq9s4AdGUsDsGyIwKEvvVbUdApfToCnUIBSsqn4862XnmwnAL5RKojnDq9xtAA8JU
         J0efCjjT1Ky5yPZFevozs0SGelZ3P8AsM66mXR1jQO71augmW9apRAniD2M+krJ1D2eL
         QeGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771853867; x=1772458667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wvQJhmU1k8bUYS3FWgrNuYxQktXn2plA05N0IuUgwa4=;
        b=FFdz2dxsHL2FZ46bKHpIn3bqiJ3zfvwM/7QDo83A82KJFb6uDleklso+WaDA8UPQxB
         RjGFo9tZRV3Bqwfq6BjrvvoNOAQPNAoyYrybU1qRdZH8MI7aRyzfmUZa5oGEGxscY84D
         hePqE5otddvPptF/gBR2v+XJwEITqbII3gKFSwgHTm4TCpCu5bKj/v9S7+uU8Sx0LBSk
         OceK32CLkC90xPlxDhj2sHUc01P04rohgwpurV6gX7D6ZIj3aaEya898+/C/hFRo/xQY
         XTwcIr/dvah7ELwuZzhLdnw39sVlieyOfTOtFZ2UHe5hBwsJFn9FOeZURVITmv+wlXsl
         +3EA==
X-Forwarded-Encrypted: i=1; AJvYcCVseyXoaWGmSNBXGkEXutTY042qingX1hwvx+hdMslautRZtr/mPDbJ1lKhnn/8PfLiu50=@lists.linux.dev
X-Gm-Message-State: AOJu0YzgrO8+XiG3q2B07RUCXS23YEiZcGfdR/o+Mtb3ggkZL6K9u1oc
	ytyyJ9+/INY8vfKCRkTEWte+/kImOZrhIQ5TIJ8i481E/SQ9IuRZovJe45xgcPTfp0Za6FT1OxK
	PpxXl3Jd48S/DPya4Qiv2ehahPTafCcNkvYRVHePHSKcKA1wKEUJvDd4=
X-Gm-Gg: AZuq6aLdfQ6Os6VsaTFetLpzZTRqP8ioHikNpl8L6MPBrATErhVYcTDQGMsdwR8wM2V
	V3ZMHXthETaNYR6QM1QghQPmqGMqg29vCtuUIj2DbcQOLGgVGINVq5HDFkKclA7aGGy+dy5VG+t
	NwTD5D5oY7bc48+MkSLUaZ334L7Pg2sGmpOY81cgtVhWPM8ldgTQDw61ExM+Eax5qI0B25bnUjd
	NPsoE/VVq7hWSFOwrbpjS0dVjFhqmQIwfKoDnKYpn85J4kNvDYcOdR9v0ilk/1/xphLZkoLLsCX
	ABYeFa4kMDQeHb3TjT9wH8DU+ZRMEC6W14AoB71OJK0P3raeUh6pLq3cQYEN4DazC4ZSsxtQMgJ
	OJ3tf07esLskQQAEEm/6tfNhJ3ML0b14Gi4B4vqTqADEVreiK9S8=
X-Received: by 2002:a05:620a:28cb:b0:8cb:4128:ec3c with SMTP id af79cd13be357-8cb8ca8205cmr959709185a.64.1771853866836;
        Mon, 23 Feb 2026 05:37:46 -0800 (PST)
X-Received: by 2002:a05:620a:28cb:b0:8cb:4128:ec3c with SMTP id af79cd13be357-8cb8ca8205cmr959704885a.64.1771853866254;
        Mon, 23 Feb 2026 05:37:46 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fa4:55d7:7aa4:50d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a42ea5ccsm89398715e9.16.2026.02.23.05.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:37:45 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:37:17 +0100
Subject: [PATCH v2 2/9] of: provide of_machine_read_model()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-soc-of-root-v2-2-b45da45903c8@oss.qualcomm.com>
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
In-Reply-To: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2138;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/FJTjprAWyIQ0p28j68CoxC5wxhBmOvR55ovCeBCxn0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnFgbTl/b6yX8U2qdfd5c/S2H7znWwXym2k+pZ
 MO32cjbGJ6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZxYGwAKCRAFnS7L/zaE
 wxZGD/4jPIFbh12WXp7rntI8dFBgq7M6R5+xsXiKYS1w9RXHJTI892M+j1L7beIpUNcpYkqP3nv
 vmRLcAyEMG09INav/3Z6yLcTOENIe+OvXqQJ1guGaOmEPg+isS4JYzMckXNBL0+QdiReYpyNXE1
 rkxJ4wyEXgoGenzNem/5lqGcgvHxFmhXT2ilVostK2JOmk/NlZ2D2x+uk9csiTfV3YObr95sX1b
 GveR3OzPuKuYvA1E6s9icHhS7nEq9xKXBcI2B9L5qwtsu8OXLpM3JsNUNx4vfNR4n6IBd8d8kta
 SJ+l6SUSwWxM+MGuC2wSB+a5GcycljvcmLKjRphj7duZDne6er392axMkRJGhTxahwQ7pyvnZwl
 Uo3xOLG0wfzLtLUhoWo3ehlZ0bbxzkhaJ/G170mFfWSQ4F+tasn6CVTXNqfmZiRvDeMWVAQFH3T
 48Zlp/AsnbU/0/ktaFdf/sgbYpdBpKWM5I/OLg1qYAHdEeRgzPJGUTtnK8C6LbR/nQgXJq6yjgm
 OW3xwuOaG39ZjEXVUtNiInBsxOZFETmmWfaSYMALTPYrsLYrP9vEnRQLvhDEtTeJ3uoBxJjqQe2
 UHrm/TILadf+0Gd9sfzdKQQAMUCkOcG9oP40wWr1pfsRZrE+OdG5s6iGTI6gMNbEKDFcJNWst0R
 NJIpI4bRnU3W5Ag==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 0_jL9vyqG2XYcYPvI3TNsZlPHOvmaqE0
X-Proofpoint-ORIG-GUID: 0_jL9vyqG2XYcYPvI3TNsZlPHOvmaqE0
X-Authority-Analysis: v=2.4 cv=CbsFJbrl c=1 sm=1 tr=0 ts=699c582b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=F_zDPpySZ_qbLQh0X2kA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfXxLTuO8ZWdrI8
 mz2ibC7CEn7Tt7SZOA7kRap0reW5iU6W55Ifw5+3JcW+hwmdNTiS3ZfV3WWhDotM90oDmXqwoeq
 Gk2q2+CQSoyDX8bhLWNTZL39LQ7UGbG+rNGUs8s5Y3ZJkZUqVwDiGQo0GFCxZAilLL07wTq2G+S
 KVWdgIue2ns3kad4qZ2lnO/+NticrghslbeA1Q9zI5tOaiQPpd0aJcy7FdSn0fXnYKO758M3x+O
 4TOGxFDvfdbeLUNLg/fv9d1K0/Y8ZlLMdInonwEUsV/hBIoetQfWSkROdePSYqf1/nQHf1q+yNy
 xcoU65WMpGLgg516WO6xDBs3ORsQG72/vJCeSwK65UKO7RThgHVb5P36I1GIbOgJrY4GNCTtAwD
 LIx2mZHH/+rE9SZBl0Jv1sQedimUgTevH7VQUePrwh9X68+A5dXcG6SmmPwIqFKpgTzZObj4ZCB
 ujxgzUFV6PdjhoIxQWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230117

Provide a helper function allowing users to read the model string of the
machine, hiding the access to the root node.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/of/base.c  | 13 +++++++++++++
 include/linux/of.h |  6 ++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index b70aec32e0e35ee232b413e548742491bf763df7..bf4a51887d7422f5b8bfc63c7b20674bf03d800e 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -449,6 +449,19 @@ int of_machine_read_compatible(const char **compatible, unsigned int index)
 }
 EXPORT_SYMBOL_GPL(of_machine_read_compatible);
 
+/**
+ * of_machine_read_model - Get the model string of this machine
+ * @model: address at which the address of the model string will be stored
+ *
+ * Returns:
+ * 0 on success, negative error number on failure.
+ */
+int of_machine_read_model(const char **model)
+{
+	return of_property_read_string(of_root, "model", model);
+}
+EXPORT_SYMBOL_GPL(of_machine_read_model);
+
 /**
  * of_machine_device_match - Test root of device tree against a of_device_id array
  * @matches:	NULL terminated array of of_device_id match structures to search in
diff --git a/include/linux/of.h b/include/linux/of.h
index 7df971d52b556f21b510a8b5ebfc8df49a2a6f64..2b95777f16f6ea1fb1e4bd0d9902cc2640d14795 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -427,6 +427,7 @@ static inline bool of_machine_is_compatible(const char *compat)
 }
 
 int of_machine_read_compatible(const char **compatible, unsigned int index);
+int of_machine_read_model(const char **model);
 
 extern int of_add_property(struct device_node *np, struct property *prop);
 extern int of_remove_property(struct device_node *np, struct property *prop);
@@ -859,6 +860,11 @@ static inline int of_machine_read_compatible(const char **compatible,
 	return -ENOSYS;
 }
 
+static inline int of_machine_read_model(const char **model)
+{
+	return -ENOSYS;
+}
+
 static inline int of_add_property(struct device_node *np, struct property *prop)
 {
 	return 0;

-- 
2.47.3

