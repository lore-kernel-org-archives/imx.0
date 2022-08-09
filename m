Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8EE5C87
	for <imx@lists.linux.dev>; Tue,  9 Aug 2022 06:08:42 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id z16so13094465wrh.12
        for <imx@lists.linux.dev>; Mon, 08 Aug 2022 23:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=contractor.linuxfoundation.org; s=google;
        h=to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=L3WJCJQNELta/B1iaIQyrtIndqVARyj46AGwoTh+rnE=;
        b=YSmBz29RK2uUV/M08uTSK4PNKorvKc72foMZgWVK6N/AqRhHHYnkTSPtncJYGfjDMU
         4PAWdqgjOS3YS2i0OWgP1l6Hs1A6M4XSKHPbv0IIka/Mw1wYrcWoQ4O1y7KF2jYfEg9Y
         l/ZVQDbeGJeRycXQm+XmlXvsnRtXagPspahD9TLwL9+TkbY2as4UcL6YrCg0dfCGnsJs
         Nkl3Xf+fN70AwR34bDsMQ8lXyang+NAIT4pPOetdiYmFT1nFFpfsrE/tbmoU8hbozeBs
         CPYjBM/H6VyStVK/UnKW0ywxTutx6HaJKF1zfufTCSiV6MUj+3t8dBf9VmVxEdBgn1o2
         b1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=L3WJCJQNELta/B1iaIQyrtIndqVARyj46AGwoTh+rnE=;
        b=AhY3sV59bRWiVCpEdF86goa6tPDvFaKAMeJjbqnUiPEj3KVGoaYL0sElcpcxf2AiuH
         I19vjPIPQ3g9Oeohej4ZFheVTAr7qGXilFJ1n/b1bX4y1l2C0WoL6a8MvLpg7nGtdJLG
         o1FwmrDefQZCceaEn14Pr+Yr5Jjo6fdmL9VTHz65rBN8sphh5hfGC6gUmF+HLHt6Pz0A
         Tj/cN7bxMj05Xcp0TxazRUkoj4rNbEkKbu1xd460eZUnsSJ9sruDfvhsRIPKuIqfTMZm
         r96kxj1qe9J0/cj5hhryJh3ZsIMFJ4brNhtRRKabFGGNopdt5Lu5ze76JhjriE6gIidB
         9MgA==
X-Gm-Message-State: ACgBeo02BFr3xmDpb+6M1gltEtida9rP9nSbPE4ADh7G3vrFbF7pTOoo
	IAtdV6+gMUQx33anz5pfbF78kFYOCudY13L2oT9Cekd6zGvClg==
X-Google-Smtp-Source: AA6agR4kSAgo5PA2sTzaH3DmfoTuusF+L0oAQEx54LMblMk4030lQB/kEXcvhnqYIhBXJlAOqdCOI4K4nI1y6nhYDb8=
X-Received: by 2002:a05:6000:1a4e:b0:220:5e43:9843 with SMTP id
 t14-20020a0560001a4e00b002205e439843mr12744167wry.566.1660025320463; Mon, 08
 Aug 2022 23:08:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Shyam Kumar <skachukattu@contractor.linuxfoundation.org>
Date: Tue, 9 Aug 2022 11:38:29 +0530
Message-ID: <CAH=dH9_Qcj3yBaZK=4RA9JwxNU2KORRSfs3aXhzzKOnE-4+9mQ@mail.gmail.com>
Subject: Test Mail to IMX
To: imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

 Hello:

 This is a test message to test successful delivery and start the
 archive for the list. Please ignore.

-- 
Regards
Shyam Kumar
The Linux Foundation Core Projects
