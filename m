Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A75A413D9C
	for <imx@lists.linux.dev>; Wed,  1 Jul 2026 10:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902237; cv=none; b=t030V44FPcNofsR1XBmzMQkUpXxKl7uhBbbQ9gyS6Rr1a2G5USzSTZrOgPGyF+IJxPgrU1ZedF2A249TYCVygbe2MC32nC6Fbrxw7TH4Du05E/OGcZXYsFVRXuXay33SRBmPmCosxaCpvhY+U/3D9TQUkqhRo0Sro9+3fqNzjuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902237; c=relaxed/simple;
	bh=xTgTAYDfdOWljotsA1TK5aPLPK9ufujbvXK7/XA377g=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=VAwu7bcDHQeOfgg1qO9fZOJ4OiLErILXLjwVtv57a9lLfYHTmoTYfPPRguRN6jxVrfWolkmupW9pKe+DqEoqJt3U9bDK7ar0SHXrIGOgw4N9S2wdbETKcICBguq44fijU9XlO9I4h3azXa1fsg2hBkn+wmzEcOVkM2B8Z+Ial3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=gCQluEAs; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="gCQluEAs"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4728c12ba97so308973f8f.0
        for <imx@lists.linux.dev>; Wed, 01 Jul 2026 03:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782902234; x=1783507034; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LrDaen+lp228qVG+WoF9YXULRRbg1Kot0gRUpiWERuw=;
        b=gCQluEAsqQWrbBsrT06KihP5bCV5Ccs9SG1roXFogx0RvZF6/nzaswetDAC/QOQ3K5
         tc7kbtq1UQfoX1WCcv9S1C1yDirhTHIYPqhjcsOXBngHIZgV0oig6IxAscSoR4EINjky
         zCIrrrkxu8TXZbsRBeTFeDFxQysYGt62T2xnbym1Bi+kYgV7jbPMl08P6PlvxQhkWgCB
         3fqtKsqllDStIjUKKasiOt2bIgRvY/h4mDE2B3HvpF128/W0A8F7OrEo5GCMGUL7oyQ7
         zEXaHd8DBBXTSxQ07gXYWZEZxwCPq0dxgbX1DKXM+ztAJI5Kay9BkDL5adSwtuks0wB/
         03GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902234; x=1783507034;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LrDaen+lp228qVG+WoF9YXULRRbg1Kot0gRUpiWERuw=;
        b=pI1B5rqqP2TnjvDCzztHgD4IbHQ8PjkncgB5v1RnF0VIhscXpkPpb4H+Bnun/OxclY
         bNlfK9NCfFAWap+zlte0kLelYREi5QN4aFqQD5T+PbxUOu7D2XnVMRlxCRfMBtJFX67j
         reu3XmpNAG1cg/m6WhghMde1PQra4JX9Zazto1VSd2dQjCIUjeXNDaqWw1OIrLRytfWX
         zOWRsId+mJC1mpCJiVTuiDWj/5hOwW5LUFnV03Jwu8PhXvffCAo2rXTH1A6d+MPeLnQN
         neJmERfovJdqqoxD8/dsK/53ozdzUBpQ4/2+N7dylyP5hZINMaCuCwTJQmveX10GvZHe
         9SIQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr2Tf0XQuS7lrVr1Yagl9dG0xEMvEanIG1t7bIPCbPoCOyWu6M/OqQ96Kjh4A9kOXbZolU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZmTgXDhaie5WPgrP7jw/54yMlHN5plmrOxq/kggb8T6OkEPaw
	3idGsG+rweLgeECdcbfm+iOLguWVshzrEho/faXXFXLokhHf0RDFjPin99zPRrTADS0=
X-Gm-Gg: AfdE7ckJv2LuZCWRG1gpD5kh2a1571P5XfH1zkxmjm1yiNwpcYj/xelhr3IgcpqXH2P
	T0Yt/UQqqPI3uw6Dro4aW9teC1jBnFccfJO9YnyvwdwNKiaff9RMbyDWG3QDyZmFfGkH2Z9d+PQ
	7zd9ObuICkEt/8Tm3ZbHV6uuZmBDoiDOy+H0ZI0VqrdEmyELCmSVJYyfn2FW485GW6YZcy+zTYF
	WFmq/qhD7pY3068aotaiRJ0vX1S4x1cPsqV1iFEnL4mFdax9OLInA94wfRTMzjeJ/3zHP2cjB3q
	TGD6655TL+rXxJiULQONOkd6/UtLgNwayczNTkKs6CJM49HVcZ8JUPjE1T2pEYYhNExu3XMbbAt
	rks2nZk4T0PSOLut3mYbTh6VWL8TEJGbT3p0qVO2SXtf6xYXZSvrlqZBFpm+RMQsgjNjcA1oQQR
	6yIMcIkurkqY8LCUtl91pC/EXq3W+BgtD8/WO6rmE9Ho4ueZTgSoRj
X-Received: by 2002:a05:6000:2606:b0:475:e7f7:ef7a with SMTP id ffacd0b85a97d-4775779827cmr1880798f8f.23.1782902234445;
        Wed, 01 Jul 2026 03:37:14 -0700 (PDT)
Received: from [192.168.7.218] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4756636cf65sm16809808f8f.21.2026.07.01.03.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:37:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 2/3] i3c: master: dw: Map CCC hardware errors to I3C
 M0/M2
From: Alexandre Mergnat <amergnat@baylibre.com>
To: tze.yee.ng@altera.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>, 
 Felix Gu <ustc.gu@gmail.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Manikanta Guntupalli <manikanta.guntupalli@amd.com>, 
 Jorge Marques <jorge.marques@analog.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-i3c@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Jarkko Nikula <jarkko.nikula@linux.intel.com>, imx@lists.linux.dev
In-Reply-To: <56a59c5ac9a09692f9ac8a74d1d3afdce553a7d1.1782824628.git.tze.yee.ng@altera.com>
References: <cover.1782824628.git.tze.yee.ng@altera.com>
 <56a59c5ac9a09692f9ac8a74d1d3afdce553a7d1.1782824628.git.tze.yee.ng@altera.com>
Date: Wed, 01 Jul 2026 12:37:06 +0200
Message-Id: <178290222675.176638.9993319878763029680.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=627; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=xTgTAYDfdOWljotsA1TK5aPLPK9ufujbvXK7/XA377g=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqRO3WMecrUypYMWBlo+QVWhD3tezdppDrKSi8w
 EH5CvXOuc+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCakTt1gAKCRArRkmdfjHU
 Raa6EACs8oZtx+RWdZ4NSVpLooHnYWmUWabBKJoE//vg6kNlDF+lmfxdtELYoPFponLBNoC8Vnl
 B2poUG1tt1sBGpZBQTvtF4NkM8aTus5nZ1vPEmjxeisyIx7NplcEN8cW2ow3YXH2Dc6J5TW5V77
 vrbgiqxe6TdnHEuEkx1rNDWeBaIKXhGx2BERpvawTiXWDuGcBOzKTNBGMoe/pSAgEx+sQFRNsas
 4G85duvlMxS2b9PbcemtJmjo9SoWrrpH+iaSU0xptl7My3XEcSpmXz6RTwHzEreHx0eaD6Z3I9k
 oxaX+4W4tB4Eg+YcIkZhCGPB4WUASgtE93s9CIYNXLWENgHmKxQORLCYfEmk5b40EPcu8UsNrye
 rLxBwozlIikH/NqL5fFMAH6og3UY3mNH7uQ7tc1FCYSPdYqocCYVVzNRyZeOEAUNn6hux8b4aUA
 Du+OuYtnRpdIQOUBXcDRl5OqM+iy0FJItRqc9o4Q9KlE4Uq+k5xG/weOVjatmCOHdYW3GY/jbQi
 xRjmgImCfBbzRR8DljwRE8wGH1K9aUJweDAJnKjYwVRUOvCVf9Puc2AFuCXOY5Wu2DFBZxA6j7L
 YrOFDpXHZSxIKzK67mMrjmkQBrq9MwVXiw/2AsZJeGFXC9yr82uwkliZjJMbyqNyJZFsEW8na3v
 hF4P7m6M1XSfTzw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

On Tue, 30 Jun 2026 06:20:26 -0700, tze.yee.ng@altera.com <tze.yee.ng@altera.com> wrote:
> Map DesignWare response-queue status to ccc->err:
> 
> - RESPONSE_ERROR_IBA_NACK -> I3C_ERROR_M2 (broadcast address not ACKed)
> - RESPONSE_ERROR_CRC, RESPONSE_ERROR_PARITY, RESPONSE_ERROR_FRAME and
>   RESPONSE_ERROR_TRANSF_ABORT -> I3C_ERROR_M0
> 
> Per the I3C spec, M2 is the case where the master does not receive ACK
> for the broadcast address (7'h7E). Target-address NACK is not reported
> as M2.
> 
> [...]

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>
