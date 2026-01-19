Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D8521FF47
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 10:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768819236; cv=none; b=COzerldiUCbiKev/zscvGy+S/ecOcmSAvBe6RoKo1qijStBEKTSHJwuaANbPp27fwylmWwcBLt15B8S5kemC4pwZ+M0tuLD/WO2DhtFqAmQv4Y+lDR5f04d7vw0ni3m0hodQ5WBiNY0rw2E4Ko46AzzESiHA+0iMwXiOwwOTBgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768819236; c=relaxed/simple;
	bh=PbFFIprfToa4la34wmCmAKivaJm7MBQFtk1XHPgSNcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UoAQMHLSyYjGHn3UNhomBhurexIkhar9oT9tTjw8kZibo1xfHyKOyf1dzrWojVzqQ+i2QUsl/W0D+N26X2xR4eTfDxLGTTCu14YT4riwyag92lb77qV2PXniPZuoWs7EUnzgGzYQ9aGWXCB6qaqwbmguM6L54mgVUyNlDq8P9lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nmtXdM1L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UbjXA1lz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nmtXdM1L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UbjXA1lz"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J90w1e1044156
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 10:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	POgrLMWtUfchu0UFOuGxBxCFcPtR77HVdsAYnI4PI1M=; b=nmtXdM1LuG33ut1P
	Lm7V2f7hk5I3fLWZx2Ma8lcDJ7ZCrv9FdZ2ITnRIwFZ69CBPrK8bR+9cjP4R9Bs7
	bufPn7Yp34AFajEbibFCHuZrxmHrVWMmetjBgVxqp5B4gzuTIbZBAmjc0PnLram/
	Ce6P2kmISeTh741nUsPDtiv8x5EAdONn7emQ5zwDvgzCCrDP7+HHN+lhx46JmOM+
	NLP2MQiy4QX7OB+ycHeaGn8hhKGe6AgKf9UydQ3PaM4zuyl5/kKOshVGJyMmTbxv
	fgKA/y5gjTZ5eV6RiYcjyiVvo8C4yICIccyZocLYI+R1c3XdWbUZ/LSiCoB1NOM5
	WFgkfA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bs79ehssx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 10:40:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a7fb4421so663299785a.3
        for <imx@lists.linux.dev>; Mon, 19 Jan 2026 02:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768819234; x=1769424034; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=POgrLMWtUfchu0UFOuGxBxCFcPtR77HVdsAYnI4PI1M=;
        b=UbjXA1lzKFpRmPYAQ9rOI478PP3m8a8FcjLKkUEkPhcvfoqz3YgdRA07wE7VpFKyye
         s0m4D5HOT4dGC+3VjgfptQOLKdNq1XXEVr7vAiQFo2DR7JYEVsFG19or/8M2YQGCCV9R
         LpdoRqoO4kBRDM1zQddeAV+CtAQY7+L9nsse8I5TIoywPiwe1F5TqpEh1/KcYi7CvlbJ
         4MsyK9dN9tZduO9oktZLnQJXA8UlWwleWt3IeJger4S4f7yib8ejsA1vVxb/eL7VL7bC
         odMFmseQ3UsJCijFLzBRMJ8LKkEhW6DIpeB/3yYGy6gYa9Dv/5p9eIptjrO9sr4wjek9
         WzUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768819234; x=1769424034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=POgrLMWtUfchu0UFOuGxBxCFcPtR77HVdsAYnI4PI1M=;
        b=SNmyEkFSnJ/A1cC7cwqq0Sn2OGbXwn6cKrKtfDNwMHDjvFTW9NhzJr2DYwmdqCyfHl
         XrN8AcX1zz+pLMwm2ENc07RWzfx/ENFQN6O0h5N/mc1Et4hn6RcTUY3b7juyg1F64UYG
         dFh5P0NPoXjiNiLPZQCsIEOdeN0QDWfNUOd6dR0yL7LmwCpG8hHm4bEXW9JxIld9u0zh
         Pae/E42jTsdeDpZKCS8a2eoIwuM0eJvXKmmW8OiK8R1s+wsCdOShW+nOmYENSPTJ6WqO
         tgqLHYrjOBwBFvih3MGkY9TmEZfkS4YlXSdd/e+rAX1fGjzk373ImkJEtGBrHHkZ9R6G
         9P/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUnyb5cnPOooon5gRWisjDIg7rNuXidIM6U8V4JZJQWt6eqwhNR5GMAx2Zo0nWBUWQ8vT8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxrpyVIOUV/OkE5l7ZXnud/1ksnpQ1HlCRvgV94xhZqMs9k5aCQ
	g5bOQ+UVdmN5bbxqHgbJVITyvg/fzpEcOHeDVxOXmwMZKVNarecHMCsTVUlyBNMlvzpSuOTNoel
	PfBPwfkaIRiA9NyWtHsfWmzPN6xHp2+o9hIXM1qIh5xseF6k0tuuNs1zdJK0tjEI=
X-Gm-Gg: AY/fxX6ugDSItyG4DzQvbXGHo3hXNN+8idnusE/ITntCTKC2ckQxCtt3AZK0StqnVqt
	pbmEMsn1Nga+96kgJbqokQ6bZ4rhAQ/hmL95A0Ug7b4Mjrl4c8t0FDWONMr38lh/HLxy1KPICft
	A9oFpIVSpqMFd0ceZZiPUNNo4YdLhWapdSKRjz0wUbJbZMoetuVg0LJS7zqKnogVR9cotUTdGe/
	qIo3hir0aurIhC1EeNCcMMBxUUocvCVr9ZRHhI01LP9hkpcR/gmEzZglKwoOvhsZi+wg4oYx42q
	j4TDsHclXZt1mz+KhwgdRhBYFHmRgFtCE7gsFjavHVL2H9TjcX4gN7HowBiwhoK9+0PMNJlBOIG
	C/kn4qN10ubF+HF+Z+SnCgWdG9vOuMorDWAp3/zue
X-Received: by 2002:a05:620a:31a1:b0:8c0:d16b:b0a7 with SMTP id af79cd13be357-8c6a66c8510mr1419194185a.2.1768819233618;
        Mon, 19 Jan 2026 02:40:33 -0800 (PST)
X-Received: by 2002:a05:620a:31a1:b0:8c0:d16b:b0a7 with SMTP id af79cd13be357-8c6a66c8510mr1419192085a.2.1768819233098;
        Mon, 19 Jan 2026 02:40:33 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4f55:d102:7129:1a8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c9cbcsm185185245e9.12.2026.01.19.02.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:40:32 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:40:12 +0100
Subject: [PATCH 1/8] of: provide of_machine_get_compatible()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-soc-of-root-v1-1-32a0fa9a78b4@oss.qualcomm.com>
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
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
        Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1899;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=PbFFIprfToa4la34wmCmAKivaJm7MBQFtk1XHPgSNcg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpbgoV9sfuT2VvhKGZTGz6p/Fpn/MdjF0ME6wrx
 zPiggHM5viJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaW4KFQAKCRAFnS7L/zaE
 w7fqD/9JerKCgcU3vWvfo1Hz4H9oZ1Phw/+RcPbdyt6LAUfl+9qyGpxqNKxeCeC13AqyqLCFTU9
 vtgZoPGxKFtxYTTB303D8vGvNtcm15aQQnQZ5qQsCTwshMpaxqWTaW0MIBH7rF4bFIuU/hu2k3H
 km9rXyr2ze7sMGjL2ZdAZbWdq7h4a7rKUOUhB42EBoY/g5t+2Nf0cGItt36Y9VKxVsUrEW1gcTb
 2q74U3LKt5IiGzLIdSosJxMYiLQL/5RPBdgkpB4CgpAhTeeCsJ6MzEz6o+3+svQCIxmIf37+OP4
 eItXkBJF/sBodLXDhni8ooEdyhdEmn2TXQaSKwq8udjKlU02e4DJa6veW6Lh3rgLkksL1E/D1au
 Eb8kDWbD13muh/brJ7zVB8uJD25VlpKrIAFoth/coR3lWabcgaICEXy1M+mPho6+NFfieRKNSkm
 QDLzesgb9UYAXcIDXJ3CaqzVZwimwNqDf/lHjrY9oBr68CdUz9p9Tgeb4O5GWheVuJ1mWY69iIp
 sdeRdFuVq+TjtnzDhJpHq+lFX5Zyi7nQwcJV3R/Ee0FmJA0BIn5iFt5DzBRvHmXjUMG3DJTVlbl
 zPo4PHcd/kCpPn5NV81nI1LKkb0ewtXTDhTXxVyOwZQe6VDeANWOXTxYLGU09Vcap5BSadE2NZv
 UBogRnzIuUXIxSA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4OCBTYWx0ZWRfXy5BLfHeOZkll
 anA2GhxDmobtOC/tDdjEOMzOLQxns6Tgv9G2E3GCB0jaI3LZYmuympiTYUmDsYxXo8Q4wW5593j
 BRM+KwW+H7FhoZF2OOPiapg9eUlEKNwGO8/NuXv5/LyF2TeF8TirpRQW9P9hhyLqQQ3PI1EsxZk
 tcmCwNDZl7YeyTEyetgcWzeA21+JBQehQReUzUqCkNRweBzDSD9W1tKv3i8QnTjoot4RDpr1U7S
 GE4BbD8FOoS2Sy1pTxhrAXYlyt3B7XLrATTs013o2P2ZnsJeN+kaKI8rssju11tU9htwl9sHrv0
 RJ+983qwS8GOIyIJX/9I/PHpodi8OVZmBzVWQZPvKxotOglAjmE51m748BsGszFL3+BnimMfXyU
 5bYcOe2fTt3YylDh5B5fDtJAMXPFiScDY7eVfouq59F2oT0GrWaGSZN9IzAwAusXCuxNzTq04WI
 CWcRrcqOl4HZGxTQzOA==
X-Authority-Analysis: v=2.4 cv=NY3rFmD4 c=1 sm=1 tr=0 ts=696e0a22 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=PolkbJsynZ_iw5VFs6kA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: JbmiyZ7LER9DnQLmFLN3JTT8vT9YR1MT
X-Proofpoint-GUID: JbmiyZ7LER9DnQLmFLN3JTT8vT9YR1MT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190088

Provide a helper function allowing users to read the compatible string
of the machine, hiding the access to the root node.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/of/base.c  | 13 +++++++++++++
 include/linux/of.h |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 0b65039ece53aa90f30da2420a893a02ab4c6dd8..a7e27d5355929abd6d156b80c52f8f8b08fe6da1 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -434,6 +434,19 @@ bool of_machine_compatible_match(const char *const *compats)
 }
 EXPORT_SYMBOL(of_machine_compatible_match);
 
+/**
+ * of_machine_get_compatible - Get the compatible string of this machine
+ * @compatible: address at which the compatible string will be stored
+ *
+ * Returns:
+ * 0 on success, negative error number on failure.
+ */
+int of_machine_get_compatible(const char **compatible)
+{
+	return of_property_read_string(of_root, "compatible", compatible);
+}
+EXPORT_SYMBOL_GPL(of_machine_get_compatible);
+
 /**
  * of_machine_device_match - Test root of device tree against a of_device_id array
  * @matches:	NULL terminated array of of_device_id match structures to search in
diff --git a/include/linux/of.h b/include/linux/of.h
index 9bbdcf25a2b448ba4ec5ddee8b35a105ca4aab8b..75423fb556ee4c108ce25144a0bdc252a89f7d1d 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -426,6 +426,8 @@ static inline bool of_machine_is_compatible(const char *compat)
 	return of_machine_compatible_match(compats);
 }
 
+int of_machine_get_compatible(const char **compatible);
+
 extern int of_add_property(struct device_node *np, struct property *prop);
 extern int of_remove_property(struct device_node *np, struct property *prop);
 extern int of_update_property(struct device_node *np, struct property *newprop);

-- 
2.47.3

