Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F064685
	for <imx@lists.linux.dev>; Tue,  9 Aug 2022 19:46:25 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-10ea7d8fbf7so15212369fac.7
        for <imx@lists.linux.dev>; Tue, 09 Aug 2022 12:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=F2KndoVJZ1qwEiReAYE4/eiX3cAMEaBR4LL9iESJz1I=;
        b=kMcxfVJKdRQaz6uprBKjiWhmotfOUa/U+T9ufXm1MSTvroA/+ShgEmscKTQezB9H98
         XWUJqTSMhLA+pAEV9QjIMQ1i68aP+MqAgFTzdinpttG/w39xDJwu5rL0uCNb8UAgmXKj
         B4wiveVBaXT94nqPyB25opIH9NfgQpLJ/cYZma5fINMKwo/v5ZDJjsJwuNf1yui5XQof
         Q2DsfoFMFRNF6d6uInO/lqELOzQGO1hJblETEtaxn+YzJnNBJQflzN7U7Ck7S+dkrcpT
         BK0T8D1wW1NsTrQsqk5gU9QDqHl+cjXShgcxtjzB8M7Cvr2YcQk9AC2b5XMP9RlQ/gPW
         hFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=F2KndoVJZ1qwEiReAYE4/eiX3cAMEaBR4LL9iESJz1I=;
        b=sQmQPI5uY8oxstMID+pR7ADWGfvmti4qfk3p/+xEZjFitRQD18Ji9Wh7vitvBXdRPw
         JrETxtSkstP/u5RJfsivUtVO6qb05Rke8faWvES+5qt4KjGyglEwbBBSNOt9uUA19bta
         eN4XvVWStefWiMIoeCc3/BZDI5iBxCIjvMmPZoNTMGTvDOQVxHS/Y3k/XI4VO/WA4jB4
         lRxZuc7cCkx9pygasuXkHDVNI4aGeZxblQ9hxFVA9zWiUjwZBPQRRDITwLRIL64Z+hfe
         Qqniw+71ZanHeyd0LoR0J80FHbqKMZqXbuxof0faAPch0yKVrudodCpEqmfhVUtUsUdM
         D5qA==
X-Gm-Message-State: ACgBeo3P0bEJlfIEMByI5Oe0XigxShED94QAEu3Mbn9s0HXIs1DWmwg7
	fp/prkVh2OS+0tXp7rGUgvCeQAMLOhFsgA==
X-Google-Smtp-Source: AA6agR7Qnq6XzsM/a/v6Vdwqm0E0zy7JNxaBl+VKHrBL6NyztVJWJoSsVfGYbKN/J57yJgDKSQKp6Q==
X-Received: by 2002:a05:6870:8984:b0:10d:d981:151f with SMTP id f4-20020a056870898400b0010dd981151fmr43176oaq.212.1660074384053;
        Tue, 09 Aug 2022 12:46:24 -0700 (PDT)
Received: from localhost ([165.225.217.40])
        by smtp.gmail.com with ESMTPSA id a10-20020aca1a0a000000b003430d6696e8sm176121oia.8.2022.08.09.12.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 12:46:23 -0700 (PDT)
From: Imx Pub <imx.pub@gmail.com>
To: imx@lists.linux.dev
Cc: Imx Pub <imx.pub@gmail.com>
Subject: [PATCH] Test: mail list test
Date: Tue,  9 Aug 2022 14:46:05 -0500
Message-Id: <20220809194605.51306-1-imx.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The double `with' is duplicated in line 769, remove one.

---
 drivers/hid/hid-lg-g15.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-lg-g15.c b/drivers/hid/hid-lg-g15.c
index b2a08233f8d5..c8f82bcbf1ab 100644
--- a/drivers/hid/hid-lg-g15.c
+++ b/drivers/hid/hid-lg-g15.c
@@ -766,7 +766,7 @@ static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)

 	/*
 	 * Some models have multiple interfaces, we want the interface with
-	 * with the f000.0000 application input report.
+	 * the f000.0000 application input report.
 	 */
 	rep_enum = &hdev->report_enum[HID_INPUT_REPORT];
 	list_for_each_entry(rep, &rep_enum->report_list, list) {

--
2.35.1


